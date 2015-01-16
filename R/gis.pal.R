gis.pal <-
function(name, n=NA, zlim=NA, raw=FALSE) {
    # get GRASS GIS palette and expand to given number of colors
    # syntax matches RColorBrewer:brewer.pal
    # GRASS color palettes can have percent mixed with qualitative values

    thispal <- try(get(name, envir=.giscolordata), silent=TRUE)
    if(class(thispal) == "try-error")
        stop("That palette does not exist.\n")

    if(raw == TRUE) {
        #supersedes all other options
        return(thispal)
    }

    if(sum(thispal$pct) > 0) {
        if(length(zlim) == 1 && is.na(zlim)) {
            stop("This palette is percentage-based, and requires zlim to be specified.\n")
        } else {
            # convert percents to values
            thispal$value[thispal$pct] <- zlim[1] + thispal$value[thispal$pct]/100 * (zlim[2] - zlim[1])
            thispal$pct <- FALSE
        }
    }

    # palette without expansion
    if(n == 0 | is.na(n)) {
        n <- nrow(thispal)
    }

    
    if(n == nrow(thispal)) {
        return(thispal)
    } else {
        if(n < nrow(thispal)) {
            stop("This palette has ", nrow(thispal), " colors and cannot be reduced.\n")
        } else {
            if(n > nrow(thispal)) {
                # expand palette to n values
                n.add <- n - nrow(thispal)
                n.gaps <- (nrow(thispal) - 1)
                gaps <- rep(round(n.add / n.gaps), n.gaps)
                gaps[1] <- gaps[1] + (n.add - sum(gaps)) # fix rounding error

                i <- 1
                newcol <- colorRampPalette(thispal$color[i:(i+1)])(gaps[i]+2)
                newval <- seq(thispal$value[i], thispal$value[i+1], length=gaps[i]+2)

                if(n.gaps > 1) {
                    for(i in 2:n.gaps) {
                        newcol <- c(newcol, colorRampPalette(thispal$color[i:(i+1)])(gaps[i]+2)[-1])
                        newval <- c(newval, seq(thispal$value[i], thispal$value[i+1], length=gaps[i]+2)[-1])
                    }
                }
            }
        }
    }


    
    # GRASS colortables can have duplicated values to indicate discontinuities
    # don't treat value and percent as one group
    newval[duplicated(newval)] <- newval[duplicated(newval)] + abs(max(newval))*0.000001

    data.frame(value=newval, pct=FALSE, color=newcol, stringsAsFactors=FALSE)
}

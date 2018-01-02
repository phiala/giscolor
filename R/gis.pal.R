gis.pal <-
function(name, pal, n=NA, zlim=NA) {
    # get GRASS GIS palette and expand to given number of colors and range
    # syntax matches RColorBrewer::brewer.pal
    # GRASS color palettes can have percent mixed with qualitative values

    if(!missing(name)) {
      thispal <- try(get(name, envir=.giscolordata), silent=TRUE)
      if(class(thispal) == "try-error")
          stop("The palette", name, "does not exist.\n")
    } else {
      thispal <- pal
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

    if(n < nrow(thispal)) {
        stop("This palette has ", nrow(thispal), " colors and cannot be reduced.\n")
    }

    if(n > nrow(thispal)) {
      # use brute-force method to create a smooth gradient

      # divide each original gap between colors into m steps
      orig.n <- nrow(thispal)
      n.gaps <- orig.n  - 1
      newval <- vector(n.gaps, mode="list")
      newcol <- newval
      for(this.gap in seq_len(n.gaps)) {
        startcol <- thispal$color[this.gap]
        endcol <- thispal$color[this.gap + 1]
        newval[[this.gap]] <- seq(thispal$value[this.gap], thispal$value[this.gap + 1], length=n)[-1]
        newcol[[this.gap]] <- grDevices::colorRampPalette(thispal$color[this.gap:(this.gap+1)])(n)[-1]
      }
      newval <- c(thispal$value[1], do.call(c, newval))
      newcol <- c(thispal$color[1], do.call(c, newcol))
      newval <- newval[seq(1, length(newval), length=n)]
      newcol <- newcol[seq(1, length(newcol), length=n)]
      thispal <- data.frame(value=newval, pct=FALSE, color=newcol, stringsAsFactors=FALSE)
    }

    # GRASS colortables can have duplicated values to indicate discontinuities
    # don't treat value and percent as one group
    thispal$value[duplicated(thispal$value)] <- thispal$value[duplicated(thispal$value)] + abs(max(thispal$value))*0.000001

    thispal
}

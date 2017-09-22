display.gis.pals <-
function(n = 5) {
    # plot all built-in GRASS palettes
    # five at a time

    allpals <- ls(envir=.giscolordata)

    opar <- par()
    par(ask=TRUE)

    par(mfrow=c(n, 1))

    for(i in seq(1, length(allpals), by=n)) {
      for(j in seq(i, min(i+n-1, length(allpals)))) {
        display.gis.pal(name=allpals[j])
      }
    }

    par <- opar
    invisible()
}

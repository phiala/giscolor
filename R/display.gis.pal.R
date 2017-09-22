display.gis.pal <-
function(name, pal) {
    # plot a single GRASS palette
    if(!missing(name)) {
        pal <- gis.pal.info(name)
    } else {
      name <- deparse(substitute(pal))
    }

    image(matrix(1:nrow(pal), ncol=1), col=pal$color, yaxt="n", xaxt="n", main=name)
    axis(1, at=seq(0, 1, length=nrow(pal)), labels=paste0(pal$value, ifelse(pal$pct, "%", "")))
}

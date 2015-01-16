recolor <-
function(x, pal, plot=TRUE, legend=TRUE, ...) {
    # relevel and potentially plot a matrix or dataframe
    # using a palette from gis.pal()

    if(sum(pal$pct) > 0) {
        stop("Use gis.pal() to turn percentages into values.\n")
    }

    if(class(x) == "SpatialGridDataFrame") {
        xdata <- as.matrix(x)
        xdata <- apply(xdata, 2, function(y)as.numeric(cut(y, pal$value)))
        x@data[,1] <- as.vector(xdata)
    } else {
        if(class(x) == "matrix" | class(x) == "data.frame") {
            # using apply on columns preserves class and dimensions
            x <- apply(x, 2, function(y)as.numeric(cut(y, pal$value)))
        } else {
            stop("Unsupported data type.\n")
        }
    }

    image(x, zlim=c(0, nrow(pal)), col=pal$color, ...)
    if(legend) {
        legend("right", legend=signif(pal$value, 3), fill=pal$color)
    }

    invisible(x)
}

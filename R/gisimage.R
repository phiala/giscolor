gisimage <-
function(x, pal, attr=1, plot=TRUE, legend=TRUE, ...) {
    # relevel and potentially plot a matrix or dataframe
    # using a palette from gis.pal()

    if(is.character(pal)) {
      # specified palette name
      # convert it to full palette
      pal <- gis.pal.info(pal)
    }


    if(sum(pal$pct) > 0) {
        # use data range to convert percentages into values
        if(class(x) == "SpatialGridDataFrame") {
          xrange <- range(x@data[, attr], na.rm=TRUE)
        } else {
          xrange <- range(as.vector(as.matrix(x)), na.rm=TRUE)
        }
        pal <- gis.pal(pal=pal, zlim=xrange)
    }

    # use pal$value as midpoint of breaks
    # pal$value does not have to be evenly spaced
    # breaks extend above and below the range of values, as in image()
    breaks <- (pal$value[-1] + pal$value[-nrow(pal)])/2
    breaks <- c(pal$value[1]-(pal$value[2]-pal$value[1])/2, breaks, pal$value[nrow(pal)] + (pal$value[nrow(pal)] - pal$value[nrow(pal)-1])/2)

    if(class(x) == "SpatialGridDataFrame") {
        x@data <- x@data[, attr, drop=FALSE]
		    xdata <- x@data[, 1]
		    xdata <- cut(xdata, breaks=breaks)
		    xdata <- as.numeric(xdata)
        x@data[, 1] <- xdata
        xmin <- min(x@data[,1], na.rm=TRUE)
        xmax <- max(x@data[,1], na.rm=TRUE)
    } else {
        if(class(x) == "matrix" | class(x) == "data.frame") {
            # using apply on columns preserves class and dimensions
            x <- apply(x, 2, function(y)as.numeric(cut(y, breaks=breaks)))
            xmin <- min(as.vector(as.matrix(x)), na.rm=TRUE)
            xmax <- max(as.vector(as.matrix(x)), na.rm=TRUE)
        } else {
            stop("Unsupported data type.\n")
        }
    }

    image(x, zlim=c(0, nrow(pal)), col=pal$color, ...)
    if(legend) {
        lpal <- pal[xmin:xmax, ]
        legend("right", legend=lpal$value, fill=lpal$color)
    }

    invisible(x)
}



gis.pal.info <-
function(name) {
    # similar to RColorBrewer::brewer.pal.info
    if(!missing(name)) {
      if(exists(name, envir=.GlobalEnv))
        results <- get(name)
      else
        results <- get(name, envir=.giscolordata)
    } else {
      filelist <- ls(envir=.giscolordata)
      results <- data.frame(name=filelist, length=NA, npct=NA, min=NA, max=NA, stringsAsFactors=FALSE)
      for(i in seq_along(filelist)) {
          thispal <- get(filelist[i], envir=.giscolordata)
          results$length[i] <- nrow(thispal)
          results$npct[i] <- sum(thispal$pct)
          results$min[i] <- min(thispal$value)
          results$max[i] <- max(thispal$value)
        }
    }
    results
}

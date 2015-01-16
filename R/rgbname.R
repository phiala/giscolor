rgbname <-
function(colorname) {
    # partial matching
    if(!(colorname %in% colors())) {
        colorname <- colors()[grepl("^aqua", colors())][1]
    }

	rgbv(col2rgb(colorname))
}

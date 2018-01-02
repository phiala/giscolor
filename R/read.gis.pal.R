read.gis.pal <-
function(filename, text) {
	# GRASS colortable files are messy
	# they all have value then color
	# value can be numeric or percent
	# color can be name, r:g:b or r g b
	# some are tab and some are space separated
	if(!missing(filename)) {
		colfile <- scan(filename, what=character(), sep="\n")
	} else {
		colfile <- scan(text=text, what=character(), sep="\n")
	}

    # delete comments
    colfile <- colfile[!grepl("^#", colfile)]

    # delete empty lines
    colfile <- colfile[!(grepl("", colfile))]

    # delete leading and trailing whitespace
    colfile <- sub("^[[:space:]]+", "", colfile)
    colfile <- sub("[[:space:]]+$", "", colfile)
    # default value string is "default" - what to do with this???
    # for now, delete it, because for the only file where it's present, srtm_plus
    # it's white anyway, and the same as NA
    colfile <- colfile[!grepl("^default", colfile)]
    # NA string is "nv"
    colfile <- colfile[!grepl("^nv", colfile)]


	value <- sapply(colfile, function(x)strsplit(x, "[[:space:]]+", fixed=FALSE)[[1]][1])
    names(value) <- NULL

    # can be percent or numeric, or mixed
    pct <- grepl("%$", value)
	value <- as.numeric(sub("%", "", value))



    # parse color definitions
	color <- sapply(colfile, function(x) {
		y <- strsplit(x, "[:[:space:]]+", fixed=FALSE)[[1]]
		y <- y[-1]
		if(length(y) == 3) {
			y <- rgbv(as.numeric(y))
		} else {
			y <- rgbname(y)
		}
		y
	})
    names(color) <- NULL
    data.frame(value, pct, color, stringsAsFactors=FALSE)
}

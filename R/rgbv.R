rgbv <-
function(colvec, maxColorValue = 255) {
	# convert a vector or matrix of RGB values to hexadecimal
	# like rgb(), but less picky about inputs
	if(is.matrix(colvec)) {
		colvec <- as.vector(colvec)
	}
	rgb(colvec[1], colvec[2], colvec[3], maxColorValue = maxColorValue)
}

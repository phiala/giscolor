\name{gisimage}
\alias{gisimage}
\title{
Display a color image.
}
\description{
Displays a grid-like colored image using color values from a GIS color palette.
}
\usage{
gisimage(x, pal, attr = 1, plot = TRUE, legend = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A grid-like data object, including matrix, data frame, or SpatialGridDataFrame.
}
  \item{pal}{
A GIS palette.
}
  \item{attr}{
If x is a SpatialGridDataFrame, can specify which value to use by position or name.
}
  \item{plot}{
If FALSE, the image is not displayed.}
  \item{legend}{
If TRUE, a legend is added to the plot.}
  \item{\dots}{
Other arguments to be passed to \code{image()}.}
}
\details{
This function enables the use of color palettes from GRASS GIS to display GIS images
within R.
A percentage-based palette is automatically expanded to match the range of values in
\code{x}. If a different range is desired, \code{gis.pal} can be used to set
up the palette before plotting.
}
\value{
The binned dataset matching the levels of the palette is returned invisibly.
}
\references{
The palettes included are adapted from the GRASS 7.0 color tables
\url{https://grasswiki.osgeo.org/wiki/Color_tableshttps://grasswiki.osgeo.org/wiki/Color_tables}.
}
\author{
Sarah Goslee
}

\seealso{
code{\link{image}}, code{\link{gis.pal}}, code{\link{gis.pal.info}},
}
\examples{

# generate sample data
mat1 <- matrix(runif(100), 10, 10)
# expand an included GIS palette to 11 colors
pal1 <- gis.pal("gyr", n=11, zlim=c(0,1))
pal1
# display the image and a color ramp
\dontrun{
layout(matrix(c(1,1,1,2), ncol=1))
gisimage(mat1, pal1, legend=FALSE)
display.gis.pal(pal=pal1)
}

# create a new palette
# note that palettes do not have to be regular
pal2 <- read.gis.pal(text = "
	0 black
	10% yellow
	20% red
	100% red
	")

\dontrun{
layout(matrix(c(1,1,1,2), ncol=1))
# A percentage-based palette is automatically expanded.
gisimage(mat1, pal2, legend=FALSE)
display.gis.pal(pal=pal2)
}
}
\keyword{ color }
\keyword{ hplot } 

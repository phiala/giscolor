\name{gis.pal}
\alias{gis.pal}
\title{
Configure GIS palette}
\description{
Expands GIS palette to desired length and range of data values.
}
\usage{
gis.pal(name, pal, n = NA, zlim = NA)
}
\arguments{
  \item{name}{
The name of a built-in GIS palette. One of \code{name} or \code{pal} must be
specified.
}
  \item{pal}{
A GIS palette. One of \code{name} or \code{pal} must be
specified.One of \code{name} or \code{pal} must be
specified.
}
  \item{n}{
The number of colors desired. Cannot be smaller than the size of the original
palette. If not specified, the size of the original palette is preserved.
}
  \item{zlim}{
The desired output range of data values. Must be specified for percentage-based
palettes.
}
}
\details{
Linear interpolation is used to add both value levels and colors between those
specified explicitly in the palette.
}
\value{
Returns a data frame with three columns:
  \item{value }{The data value or percentage associated with each color.}
  \item{pct }{TRUE if the entry is a percentage; FALSE for a data value.}
  \item{color }{Color specification in hexadecimal format.}
}

\author{
Sarah Goslee
}

\seealso{
\code{\link{gis.pal.info}}, \code{\link{gisimage}}
}
\examples{

  # different sizes of palette
  par(mfrow=c(5,1))
  display.gis.pal(pal=gis.pal("gyr", n=3, zlim=c(0,1)))
  display.gis.pal(pal=gis.pal("gyr", n=4, zlim=c(0,1)))
  display.gis.pal(pal=gis.pal("gyr", n=5, zlim=c(0,1)))
  display.gis.pal(pal=gis.pal("gyr", n=13, zlim=c(0,1)))
  display.gis.pal(pal=gis.pal("gyr", n=28, zlim=c(0,1)))

  # color an image
  mat1 <- matrix(runif(100), 10, 10)
  pal1 <- gis.pal("gyr", n=11, zlim=c(0,1))
  pal1
  gis.pal.info("gyr")
  layout(matrix(c(1,1,1,2), ncol=1))
  gisimage(mat1, pal1, legend=FALSE)
  display.gis.pal(pal=pal1)

}
\keyword{ color } 

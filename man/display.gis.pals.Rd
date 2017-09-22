\name{display.gis.pals}
\alias{display.gis.pals}
\title{
Display all built-in GIS palettes.
}
\description{
Draws a series of GIS palettes to the default graphics device.}
\usage{
display.gis.pals(n = 5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
The number of palettes to display per page.
}
}
\references{
The palettes included are adapted from the GRASS 7.0 color tables
\url{https://grass.osgeo.org/grass70/manuals/r.colors.html}.
}
\author{
Sarah Goslee
}

\seealso{
\code{\link{display.gis.pal}}, \code{\link{gis.pal.info}}
}
\examples{
\dontrun{
display.gis.pals()
}
}
\keyword{ color }
\keyword{ hplot }

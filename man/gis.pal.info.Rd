\name{gis.pal.info}
\alias{gis.pal.info}
\title{
Print information about all built-in GIS palettes, or print a single palette.
}
\description{
Displays a list of GIS palettes included with the \code{giscolor} package, or prints
complete information for one palette.}
\usage{
gis.pal.info(name)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
Optional name of a single palette, either created locally or included with
the giscolor package.
}
}
\details{
If no name is provided, this function will print information about all the GIS
palettes included with the \code{giscolor} package. If a name is provided, first the
local environment, then the palettes included with \code{giscolor} will be searched.}
\value{
Returns either a data frame listing all of the built-in GIS palettes, or a
data frame containing the specific information for a single palette.
}
\references{
The palettes included are adapted from the GRASS 7.0 color tables
\url{https://grasswiki.osgeo.org/wiki/Color_tableshttps://grasswiki.osgeo.org/wiki/Color_tables}.
}
\author{
Sarah Goslee
}

\seealso{
\code{\link{display.gis.pal}}
}
\examples{
gis.pal.info() # all GIS palettes
gis.pal.info("wave") # details of the wave palette
}
\keyword{ color } 

\name{read.gis.pal}
\alias{read.gis.pal}
\title{
Convert a GRASS text color table to an R palette.
}
\description{
Reads and parses a GRASS GIS color table from a text file or directly. Either
filename or text must be specified.
}
\usage{
read.gis.pal(filename, text)
}
\arguments{
  \item{filename}{
The name of a text file containing a GRASS GIS color table.
}
  \item{text}{
The text of a GRASS GIS color table.
}
}
\details{
GRASS GIS color tables can mix percentages and data values, and named and RGB
color specifications. This function imports them into a palette format usable
in \code{R}.
}
\value{
Returns a data frame with three columns:
  \item{value }{The data value or percentage associated with each color.}
  \item{pct }{TRUE if the entry is a percentage; FALSE for a data value.}
  \item{color }{Color specification in hexadecimal format.}
}
\references{
More information on GRASS GIS color tables is available from the manual at \url{https://grass.osgeo.org/grass70/manuals/r.colors.html}.
}
\author{
Sarah Goslee
}

\seealso{
\code{\link{display.gis.pal}}, \code{\link{gis.pal.info}}
}
\examples{
samplepal <- read.gis.pal(text =
"0 black
10% yellow
78 blue
100% 0:255:230
nv white")
display.gis.pal(pal=samplepal)
}

\keyword{ color } 

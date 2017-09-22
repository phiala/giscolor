\name{display.gis.pal}
\alias{display.gis.pal}
\title{
Draw a GIS palette.
}
\description{
Draws a single GIS palette to the active device. Either name or palette
must be specified.
}
\usage{
display.gis.pal(name, pal)
}
\arguments{
  \item{name}{
The name of one of the palettes included with the \code{giscolor} package.
}
  \item{pal}{
A palette.
}
}
\value{
Draws on the active graphics device.
}
\author{
Sarah Goslee
}

\seealso{
\code{\link{display.gis.pals}}, \code{\link{gis.pal.info}}
}
\examples{
\dontrun{
display.gis.pal(name="wave")
}
}

\keyword{ color }
\keyword{ hplot } 

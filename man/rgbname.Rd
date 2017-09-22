\name{rgbname}
\alias{rgbname}
\title{
Return the hexadecimal color string for a named color.
}
\description{
Converts a named color to its hexadecimal representation.
}
\usage{
rgbname(colorname)
}
\arguments{
  \item{colorname}{
A named color. See \code{colors()} for the complete list.
}
}
\value{
A hexadecimal color string.
}
\author{
Sarah Goslee
}
\seealso{
\code{\link{colors}}, \code{\link{col2rgb}}, \code{\link{rgbv}}
}
\examples{
  rgbname("white")
  rgbname("lightsalmon")
}
\keyword{ color }

\name{rgbv}
\alias{rgbv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Convert RGB notation to a hexadecimal color string.
}
\description{
Converts a RGB string in either colon-separated or vector format to hexadecimal equivalent.
}
\usage{
rgbv(colvec, maxColorValue = 255)
}
\arguments{
  \item{colvec}{
  A colon-separated RGB string or a three-element RGB vector.
}
  \item{maxColorValue}{
  The maximum value for the RGB elements, usually the default of 255.
}
}
\value{
A hexadecimal color string.
}
\author{
Sarah Goslee
}

\seealso{
\code{\link{rgbname}}, \code{\link{rgb}}
}
\examples{
rgbv("0:255:230")
rgbv(c(0, 255, 230))
}
\keyword{ color }

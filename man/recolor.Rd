\name{recolor}
\alias{recolor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
recolor(x, pal, plot = TRUE, legend = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{pal}{
%%     ~~Describe \code{pal} here~~
}
  \item{plot}{
%%     ~~Describe \code{plot} here~~
}
  \item{legend}{
%%     ~~Describe \code{legend} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, pal, plot = TRUE, legend = TRUE, ...) 
{
    if (sum(pal$pct) > 0) {
        stop("Use gis.pal() to turn percentages into values.\n")
    }
    if (class(x) == "SpatialGridDataFrame") {
        xdata <- as.matrix(x)
        xdata <- apply(xdata, 2, function(y) as.numeric(cut(y, 
            pal$value)))
        x@data[, 1] <- as.vector(xdata)
    }
    else {
        if (class(x) == "matrix" | class(x) == "data.frame") {
            x <- apply(x, 2, function(y) as.numeric(cut(y, pal$value)))
        }
        else {
            stop("Unsupported data type.\n")
        }
    }
    image(x, zlim = c(0, nrow(pal)), col = pal$color, ...)
    if (legend) {
        legend("right", legend = signif(pal$value, 3), fill = pal$color)
    }
    invisible(x)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

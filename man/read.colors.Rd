\name{read.colors}
\alias{read.colors}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read.colors(filename)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filename}{
%%     ~~Describe \code{filename} here~~
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
function (filename) 
{
    colfile <- scan(filename, what = character(), sep = "\n")
    colfile <- colfile[!grepl("^#", colfile)]
    colfile <- sub("^[[:space:]]+", "", colfile)
    colfile <- sub("[[:space:]]+$", "", colfile)
    colfile <- colfile[!grepl("^default", colfile)]
    colfile <- colfile[!grepl("^nv", colfile)]
    value <- sapply(colfile, function(x) strsplit(x, "[[:space:]]+", 
        fixed = FALSE)[[1]][1])
    names(value) <- NULL
    pct <- grepl("\%$", value)
    value <- as.numeric(sub("\%", "", value))
    color <- sapply(colfile, function(x) {
        y <- strsplit(x, "[:[:space:]]+", fixed = FALSE)[[1]]
        y <- y[-1]
        if (length(y) == 3) {
            y <- rgbv(as.numeric(y))
        }
        else {
            y <- rgbname(y)
        }
        y
    })
    names(color) <- NULL
    data.frame(value, pct, color, stringsAsFactors = FALSE)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

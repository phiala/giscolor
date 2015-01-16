\name{gis.pal}
\alias{gis.pal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
gis.pal(name, n = NA, zlim = NA, raw = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
%%     ~~Describe \code{name} here~~
}
  \item{n}{
%%     ~~Describe \code{n} here~~
}
  \item{zlim}{
%%     ~~Describe \code{zlim} here~~
}
  \item{raw}{
%%     ~~Describe \code{raw} here~~
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
function (name, n = NA, zlim = NA, raw = FALSE) 
{
    thispal <- try(get(name, envir = .giscolordata), silent = TRUE)
    if (class(thispal) == "try-error") 
        stop("That palette does not exist.\n")
    if (raw == TRUE) {
        return(thispal)
    }
    if (sum(thispal$pct) > 0) {
        if (length(zlim) == 1 && is.na(zlim)) {
            stop("This palette is percentage-based, and requires zlim to be specified.\n")
        }
        else {
            thispal$value[thispal$pct] <- zlim[1] + thispal$value[thispal$pct]/100 * 
                (zlim[2] - zlim[1])
            thispal$pct <- FALSE
        }
    }
    if (n == 0 | is.na(n)) {
        n <- nrow(thispal)
    }
    if (n == nrow(thispal)) {
        return(thispal)
    }
    else {
        if (n < nrow(thispal)) {
            stop("This palette has ", nrow(thispal), " colors and cannot be reduced.\n")
        }
        else {
            if (n > nrow(thispal)) {
                n.add <- n - nrow(thispal)
                n.gaps <- (nrow(thispal) - 1)
                gaps <- rep(round(n.add/n.gaps), n.gaps)
                gaps[1] <- gaps[1] + (n.add - sum(gaps))
                i <- 1
                newcol <- colorRampPalette(thispal$color[i:(i + 
                  1)])(gaps[i] + 2)
                newval <- seq(thispal$value[i], thispal$value[i + 
                  1], length = gaps[i] + 2)
                if (n.gaps > 1) {
                  for (i in 2:n.gaps) {
                    newcol <- c(newcol, colorRampPalette(thispal$color[i:(i + 
                      1)])(gaps[i] + 2)[-1])
                    newval <- c(newval, seq(thispal$value[i], 
                      thispal$value[i + 1], length = gaps[i] + 
                        2)[-1])
                  }
                }
            }
        }
    }
    newval[duplicated(newval)] <- newval[duplicated(newval)] + 
        abs(max(newval)) * 1e-06
    data.frame(value = newval, pct = FALSE, color = newcol, stringsAsFactors = FALSE)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

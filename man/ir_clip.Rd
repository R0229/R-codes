% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ir_clip.R
\name{ir_clip}
\alias{ir_clip}
\title{Clips infrared spectra to new wavenumber ranges}
\usage{
ir_clip(x, range)
}
\arguments{
\item{x}{An object of class \code{\link[=ir_new_ir]{ir}}.}

\item{range}{A \code{data.frame} with two columns and a row for each
wavenumber range to keep. The columns are:
\describe{
\item{start}{A numeric vector with start values for wavenumber ranges.}
\item{end}{A numeric vector with end values for wavenumber ranges.}
}
If \code{range} has more than one row, multiple ranges are clipped from
\code{x} and merged together. Overlapping ranges are not allowed.}
}
\value{
An object of class \code{ir} where spectra have been clipped.
}
\description{
\code{ir_clip} clips infrared spectra to a new, specified, wavenumber range
or multiple new specified wavenumber ranges.
}
\examples{
## clipping with one range

# define clipping range
range <-
  data.frame(start = 900, end = 1000)

# clip
x <-
   ir::ir_sample_data \%>\%
   ir::ir_clip(range = range)

## clipping with mutliple ranges

range <-
  data.frame(start = c(900, 1900), end = c(1000, 2200))

# clip
x <-
   ir::ir_sample_data \%>\%
   ir::ir_clip(range = range)
}

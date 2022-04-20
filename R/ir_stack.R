#' Stacks a matrix with spectra into an object of class `ir`
#'
#' `ir_stack` takes a matrix or data frame with infrared spectra and
#' converts it into a  list column corresponding to the column `spectra` in
#' objects of class `ir`.
#'
#' @param x A matrix or data frame with a first column (`x`) containing x
#' axis values of the spectra (e.g. wavenumbers) and all remaining columns
#' containing intensity values of spectra. Column names are assumed to represent
#' @return A [tibble::tibble()] with the stacked spectra in
#' column `spectra`.
#' @examples
#' x <-
#'    ir::ir_sample_data %>%
#'    ir::ir_flatten() %>%
#'    ir::ir_stack()
#' @export
ir_stack <- function(x) {

  if(is.matrix(x)) {
    x <- as.data.frame(x)
  }
  if(!(is.matrix(x) || is.data.frame(x))) {
    rlang::abort(paste0("`x` must be a matrix, not ", class(x)[[1]], "."))
  }

  spectra <- lapply(x[,-1, drop = FALSE], function(y){
    d <- tibble::tibble(x = x[, 1, drop = TRUE],
                        y = y)
    d[!is.na(d$y), ]
  })
  tibble::tibble(spectra = spectra)

}


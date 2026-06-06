p <- function(x, accuracy = .1, ...) {
  # format as percentage - useful for inline so you don't have to type a bunch
  scales::percent(x, accuracy = accuracy, ...)
}

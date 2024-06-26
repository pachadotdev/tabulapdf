#' @title rJava logging
#' @description Toggle verbose rJava logging
#' @details This function turns off the somewhat verbose rJava logging, most of which is uninformative. It is called automatically when tabulapdf is attached via \code{library()}, \code{require}, etc. To keep logging on, load the package namespace using \code{requireNamespace("tabulapdf")} and reference functions in using fully qualified references (e.g., \code{tabulapdf::extract_tables()}.
#' @note This resets a global Java setting and may affect logging of other rJava operations, requiring a restart of R.
#' @return \code{NULL}, invisibly.
#' @author Thomas J. Leeper <thosjleeper@gmail.com>
#' @examples
#' \dontrun{
#' stop_logging()
#' }
#' @importFrom rJava J
#' @export
stop_logging <- function() {
    J("java.util.logging.LogManager")$getLogManager()$reset()
    invisible(NULL)
}

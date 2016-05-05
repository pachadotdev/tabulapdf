#' @title extract_metadata
#' @description Extract metadata from a file
#' @param file A character string specifying the path or URL to a PDF file.
#' @details This function extracts metadata from a PDF
#' @return A list.
#' @author Thomas J. Leeper <thosjleeper@gmail.com>
#' @examples
#' \dontrun{
#' # simple demo file
#' f <- system.file("examples", "data.pdf", package = "tabulizer")
#' 
#' extract_metadata(f)
#' }
#' @seealso \code{\link{extract_tables}}, \code{\link{extract_areas}}, \code{\link{extract_text}}
#' @importFrom rJava J new
#' @export
extract_metadata <- function(file) {
    file <- localize_file(path = file)
    PDDocumentClass <- new(J("org.apache.pdfbox.pdmodel.PDDocument"))
    pdfDocument <- PDDocumentClass$load(file)
    PDDocumentClass$close()
    on.exit(pdfDocument$close())
    
    info <- pdfDocument$getDocumentInformation()
    list(pages = pdfDocument$getNumberOfPages(),
         title = info$getTitle(),
         author = info$getAuthor(),
         subject = info$getSubject(),
         keywords = info$getKeywords(),
         creator = info$getCreator(),
         producer = info$getProducer(),
         created = info$getCreationDate()$getTime()$toString(),
         modified = info$getModificationDate()$getTime()$toString(),
         trapped = info$getTrapped())
}
#' sysdata
#'
#' Common parameters used in this package
#'
#' Exported system-wide parameters include: \cr
#' DataArchive - A file path that source text data files stored. \cr
#' DataSeperator - The dimiliter of text files, i.e "\{". \cr
#' DataHeaders - Column names of text files. \cr
#' CtrlPrefix - The Prefix of dataset control symbol, i.e. GOCF. \cr
#' FileSuffix  - The suffix as a naming convention of all text files, such as ...20181202.TXT. \cr
#' klb_to_mt - convert klb to metric tons. \cr
#' kbu_to_mt - convert k bushels to metric tons. \cr
#' st_to_mt - convert short tons to metric tons.
#'
#' @keywords "package parameter", "naming convention"
#' @export
sysdata <- c("DataArchive, DataSeperator, DataHeaders, CtrlPrefix, FileSuffix, klb_to_mt, kbu_to_mt, st_to_mt")

#' @export
DataArchive <- "//admnt1/oilseedproc_position/DW_Projects/KhalixData/parking"

#' @export
DataSeperator <- "{"

#' @export
DataHeaders <- c("Accounts", "Timeper", "Entities", "Currency", "Segments", "D1Default", "D2Default", "Controls", "N", "Value")

#' @export
CtrlPrefix <- "GOCF"

#' @export
FileSuffix <- "%Y%m%d.TXT"

#' @export
klb_to_mt <- 0.4536

#' @export
kbu_to_mt <- 27.2158

#' @export
st_to_mt <- 0.9072



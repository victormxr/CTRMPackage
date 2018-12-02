#' get_base_data function
#'
#' To combine txt files for today, yesterday, last week, last month, last quarter and last year as in report controls table.
#'
#'  @references FileSuffix, DataSeperator, DataHeaders from sysdata.rda.
#' @param a A file path that archives the text files in *YYYYMMDD.TXT naming convention.
#' @param d A report control date.
#' @return data A data.frame that contains data from all text files from one control date.
#'
#' @export
get_base_data <- function(a = DataArchive,d = Sys.Date()) {
  #get a file list
  files <- list()
  p <- paste0("*",format(d, FileSuffix))          # FileSuffix from sysdata.rda
  files <- list.files(path = a, pattern = p, full.names = TRUE)

  # read contents from the first file into the dataframe
  data <- data.frame()
  data <- read.csv2(files[1], sep = DataSeperator, header = FALSE,  stringsAsFactors = FALSE)
  row.names(data) <- NULL                         # remove row names
  data <- data[!grepl("[A-Za-z]",data[[10]]),]      # filter out none numeric data

  # read contents from all other files
  for(n in 2:length(files)) {
    df <- read.csv2(files[n], sep = DataSeperator, header = FALSE,  stringsAsFactors = FALSE)
    row.names(df) <- NULL
    df <- df[!grepl("[A-Za-z]",df[[10]]),]      # filter out none numeric data
    data <- rbind(data, df)
  }

  # convert last column (the measure column) from character to numeric and return results
  names(data) <- DataHeaders         # assign column names
  names(data)[ncol(data)] <- "Qty"           # name last column as "Qty"
  data <- transform(data, Qty = as.numeric(Qty))   # force last column to be numeric
  names(data)[ncol(data)] <- tail(DataHeaders, n=1)    # restore last column's name

#return results
  return(data)
  }

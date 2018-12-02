#' get_controls function
#'
#' To generate a list of report controls (report run_date):
#' today, yesterday, last week, last month, last quarter and last year
#' It will adjust the dates by checking with archived data files (in *YYYYMMDD.TXT naming convention).
#' if no data was archived in a date, it will back track until it finds the next data available date.
#'
#' @param archive The file path where data files are archived, default to current directory.
#' @references CtrlPrefix, Filesuffix from sysdata.rda.
#' @return A data.frame of report run_dates, control periods, control symbols (GOCFxxxxxx).
#'
#'
#' @export
get_controls <- function(archive=DataArchive){
  d <- Sys.Date()
  p <- archive

  #customized prefix of control symbol
  prefix <- CtrlPrefix

  #check if today's is archived, otherwise minus one day
  if(!files_archived(d,p)) d = d-1

  #initiate and build six control sysmbols
   report_controls <- data.frame(
     Dates = seq(d,by = "-1 day",length.out = 6),
     Periods = c("Today","Yesterday","Last Week","Last Month", "Last Quarter","Last Year"),
     Controls = sample(letters,6),
     stringsAsFactors = FALSE
   )
   report_controls$Dates[3] = seq(d,by = "-1 week", length.out = 2)[2]
   report_controls$Dates[4] = seq(d,by = "-1 month", length.out = 2)[2]
   report_controls$Dates[5] = seq(d,by = "-1 quarter", length.out = 2)[2]
   report_controls$Dates[6] = seq(d,by = "-1 year", length.out = 2)[2]

  #cross-check with available data files in archive and adjust control dates
  for (n in 1:nrow(report_controls)) {
    dd = report_controls$Dates[n]
    report_controls$Controls[n] = paste0(prefix,format(dd,"%d%m%y")) # add control symbol
    brk = 0 # safeguard from indefinite repeat loop.
    # reduce one day at a time until files in archive found.
    repeat {
      if(files_archived(dd,p) || brk >7) break
      dd = dd - 1
      brk = brk + 1
      report_controls$Dates[n] = dd
      report_controls$Controls[n] = paste0(prefix,format(dd,"%d%m%y"))
    }
  }

  #return controls table
   report_controls
}

# to check if files in *YYYYMMDD.TXT pattern exist in archive
#' @export
files_archived <- function(dd,p){
  ptn <- paste0("*",format(dd, FileSuffix))
  files <- list.files(p, pattern = ptn,ignore.case = TRUE, full.names = TRUE )
  length(files) > 0
}


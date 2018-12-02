#' main function
#'
#' This is a sample codes of the main steps to create a data model of fact and dimension tables.
#'
#' @references DataSeperator, DataHeaders from sysdata.rda.
#' @param NULL
#' @return NULL
#' @export
main <- function(){

#library(CTRMPackage)
#read report_date, accounts, entities and segments dimensions from system variable (sysdata.rda)
As_of_Date <- get_report_date()
Accounts <- dim_accounts
Entities <- dim_entities
Segments <- dim_segments

#get a report controls dimension table and a list of dates
Controls <- get_controls()
ds <- Controls$Dates


#get a floating timeper dimension table for all dates
for (n in 1:length(ds)) {
  df <- get_timeper(ds[n])
  df$Controls <- Controls$Controls[n]
  df$TimeperCtrl <- paste0(df$Controls, "-", df$Timeper)
  if ( n == 1) Timeper <- df
  else Timeper <- rbind(Timeper, df)
}

#get, clean and combine khalix data for all control dates
for (n in 1:length(ds)){
  df <- get_base_data(DataArchive, ds[n])
  df$TimeperCtrl <- paste0(df$Controls, "-", df$Timeper)
  if (n == 1) Positions <- df
  else Positions <- rbind(Positions, df)
}

#clean up
remove(n)
remove(ds)
remove(df)

}
#END

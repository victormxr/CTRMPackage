#' get_timeper function
#'
#' To create a twelve month plus forward timeper table for spread position reporting.
#'
#'
#' @param d The run date. it will be converted to position as-of date using get_report_date().
#' @return A data frame of 12 month plus forward time table with these columns:
#'         MonthId, Month dates, Timeper, Soybean option months, Canola option months,
#'         Soymeal option months, Soybean Crush options, Canola Crush options,
#'         August Old/new Crop, September old/new crop, October old/new crop
#' @export
get_timeper <- function(d = Sys.Date()){
    d <- get_report_date(d)
    yyyy = as.numeric(format(d,'%Y'))  # get year number (4 digits)
    mm = as.numeric(format(d,'%m'))  # get month number
    cm = as.Date(paste0(yyyy,'/',mm,'/01')) # get current month

# initiate with the first column of a data.frame to hold the timeper table
   timeper <- data.frame(
    MonthId = 1:13,
    Months = as.Date(rep("2018-1-1",13)),
    Timeper = rep("CFWD",13),
    Soybean = rep(" ",13),
    Canola = rep(" ",13),
    Soymeal = rep(" ",13),
    SoybeanCrush = rep(" ",13),
    CanolaCrush = rep(" ",13),
    AugustCrop = rep("Old Crop",13),
    SeptemberCrop = rep("Old Crop",13),
    OctoberCrop = rep("Old Crop",13),
    stringsAsFactors = FALSE
    )

# get month as date value
    timeper$Months <- seq(cm,length.out = 13, by = "1 month")

#get month symbol in Cyymm format
    Cyymm <- function(x) {
      paste0('C',format(x,'%y'),format(x,'%m'))
    }
    timeper$Timeper <- sapply(timeper$Months,Cyymm)
    timeper$Timeper[13] <- "CFWD"

#get option months by deliver months for different commodity
  get_option_month <- function(x,commodity) {
      o <- switch(commodity,
                 soybean = c("SF","SH","SH","SK","SK","SN","SN","SQ","SU","SX","SX","SF"),
                 canola = c("RSF","RSH","RSH","RSK","RSK","RSN","RSN","RSX","RSX","RSX","RSX","RSF"),
                 soymeal = c("SMF","SMH","SMH","SMK","SMK","SMN","SMN","SMQ","SMU","SMV","SMZ","SMZ"),
                 soycrush = c("HHH","HHH","KKK","KKK","NNN","NNN","QQQ","XUU","XVV","XZZ","XZZ","FFF"),
                 canolacrush = c("HHH","HHH","KKK","KKK","NNN","NNN","XQQ","XUU","XVV","XZZ","XZZ","FFF")
               )
       sym <- o[as.numeric(format(x,'%m'))]
       s <- substr(sym,nchar(sym),nchar(sym))
       m <- switch(s, F="01",H="03",K="05",N="07",Q="08",U="09",V="10",X="11",Z="12")
       y <- as.numeric(format(x,'%Y'))
       d <- as.Date(paste0(format(x,'%Y'),'-',m,'-01'))
       if(d<x){y = y+1}
       return(paste0(sym, ' ', as.character(y %% 100)))
  }
    timeper$Soybean <- mapply(get_option_month,timeper$Months,"soybean")
    timeper$Canola <- mapply(get_option_month,timeper$Months,"canola")
    timeper$Soymeal <- mapply(get_option_month,timeper$Months,"soymeal")
    timeper$SoybeanCrush <- mapply(get_option_month,timeper$Months,"soycrush")
    timeper$CanolaCrush <- mapply(get_option_month,timeper$Months,"canolacrush")

#option expires after the 14th day
    if(as.numeric(format(d,'%d')) > 14){
      timeper$Soybean[1] = timeper$Soybean[2]
      timeper$Canola[1] = timeper$Canola[2]
      timeper$Soymeal[1] = timeper$Soymeal[2]
    }

    if(as.numeric(format(d,'%d')) > 14 && format(d,'%m') == "11"){
      timeper$SoybeanCrush[1] = paste0("FZZ",substr(timeper$SoybeanCrush[1],4,7))
      timeper$CanolaCrush[1] = paste0("FZZ",substr(timeper$CanolaCrush[1],4,7))
    }

#AUGUST of new crop year - canola
    w <- which(months(timeper$Months) == "August")
    n <- w[length(w)] - 1
    timeper$AugustCrop[0:-n] <- "New Crop"

#SEPTEMBER as new crop year - flaxseed
    w <- which(months(timeper$Months) == "September")
    n <- w[length(w)] - 1
    timeper$SeptemberCrop[0:-n] <- "New Crop"

#OCTOBER as new crop year - soybeans and etc.
    w <- which(months(timeper$Months) == "October")
    n <- w[length(w)] - 1
    timeper$OctoberCrop[0:-n] <- "New Crop"

return(timeper)
}


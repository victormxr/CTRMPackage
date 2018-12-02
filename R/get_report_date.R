#' get_report_date function
#'
#' To get a report date for a given run_date, adjusted by weekends and holidays.
#'
#' @param d The report run date or a historical date (report control date), default to current date (Sys.Date).
#' @return A date value
#' @export
get_report_date <- function(d=Sys.Date()){
  d = d - 1
  while(isHoliday(d) || isWeekend(d)) d = d - 1
  return(d)
}

#function isWeekend(), returns TRUE or FALSE
#' @export
isWeekend <- function(d){
  ret = FALSE
  if(weekdays(d)=='Saturday') ret = TRUE
  if(weekdays(d)=='Sunday') ret = TRUE
  return(ret)
}

#function isHoliday(), returns TRUE or FALSE
#' @export
isHoliday <- function(d){
    #get basic information of the date
    #nine CBOT official holidays.
    ret = FALSE            # set return to false
    yy = as.numeric(format(d,'%Y')) #get year number (4 digits)
    mm = as.numeric(format(d,'%m'))  # get month number
    dd = as.numeric(format(d,'%d'))  # get day number
    ww = as.numeric(format(d,'%w'))  # get week number

    #check on fixed hoiflidays
    if(mm==1 && dd==1){ret=TRUE}
    if(mm==7 && dd==4){ret=TRUE}  #Independence day
    if(mm==12 && dd==25){ret=TRUE} #Christmas day

    #check on floating holidays
    if(d==MartinLutherKingDay(yy)){ret=TRUE}
    if(d==PresidentDay(yy)){ret=TRUE}
    if(d==MemorialDay(yy)){ret=TRUE}
    if(d==LaborDay(yy)){ret=TRUE}
    if(d==ThanksgivingDay(yy)){ret=TRUE}
    if(d==Goodfriday(yy)){ret=TRUE}

    #return T or F
    return(ret)
}

#3rd Monday of Januar
MartinLutherKingDay <- function(yy){
     d =  as.Date(paste0(toString(yy),'/1/1'))
     w = as.numeric(format(d,'%w'))
     if(w>1){d=d-w+22} else {d=d-w+15}
     return(d)
}

#3rd Monday of February
PresidentDay <- function(yy){
     d =  as.Date(paste0(toString(yy),'/2/1'));
     w = as.numeric(format(d,'%w'));
     if(w>1){d=d-w+22} else {d=d-w+15};
     return(d)
}

#Last Friday of March
Goodfriday <- function(yy){
  d = as.Date(paste0(toString(yy),'/3/31'))
  w = as.numeric(format(d,'%w'))
  while (!w==5){
    d = d -1
    w = as.numeric(format(d,'%w'))
  }
  return(d)
}

#Last Monday of May
MemorialDay <- function(yy){
     d =  as.Date(paste0(toString(yy),'/5/1'));
     w = as.numeric(format(d,'%w'));
     if(w>1){d=d-w+29} else {d=d-w+22};
     return(d)
}

#1st Monday of September
LaborDay <- function(yy){
     d =  as.Date(paste0(toString(yy),'/9/1'));
     w = as.numeric(format(d,'%w'));
     if(w>1){d=d-w+8} else {d=d-w+1};
     return(d)
}

#2nd Monday of October
ColumbusDay <- function(yy){
     d =  as.Date(paste0(toString(yy),'/10/1'));
     w = as.numeric(format(d,'%w'));
     if(w>1){d=d-w+15} else {d=d-w+8};
     return(d)
}

#last Thursday of November
ThanksgivingDay <- function(yy){
     d =  as.Date(paste0(toString(yy),'/11/1'));
     w = as.numeric(format(d,'%w'));
     if(w>4){d=d-w+28+4} else {d=d-w+21+4};
     return(d)
}


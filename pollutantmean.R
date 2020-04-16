pollutantmean <- function(directory, pollutant, id = 1:332) {
  old_dir <- getwd()
  setwd(directory)
  dp <- vector()
  for (val in id) {
    if (val<10) {
      val <- paste("00",val,".csv",sep="")
    } else if (val<100) {
      val <- paste("0",val,".csv",sep="")
    } else {
      val <- paste(val,".csv",sep="")
    }
    df <- read.csv(val)
    df <- df[pollutant]
    df <- df[!is.na(df)]
    dp <- c(dp,df)
  }
  print(mean(dp))
  setwd(old_dir)
}
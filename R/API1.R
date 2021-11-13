library(readxl)
library(httr)
library(RCurl)
library(readxl)
read_data <- function(url){
  GET(url, write_disk(tf <- tempfile(fileext = ".xls")))
  df1 <- read_excel(tf, 1L)
  df1 <- df1[-1,]
  names(df1) <- as.matrix(df1[1, ])
  df1 <- df1[-1, ]
  output <- list(df1, nrow(df1), ncol(df1))
  return(output)
}
read_data("https://data.val.se/val/val2014/statistik/2014_landstingsval_per_kommun.xls")


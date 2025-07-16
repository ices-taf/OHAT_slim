# fetch data from online storage

library(TAF)

tag <- "2025v1"

url <- paste0("https://github.com/ices-taf/OHAT_slim/releases/download/", tag, "/")

download(paste0(url, "biota.rds"))
download(paste0(url, "sediment.rds"))
download(paste0(url, "water.rds"))


calling_url <- function() {
  paste0(
    "https://dome.ices.dk/ohat/Home/GettrResult?seriesID=", gsub(" ", "%20", series_id),
    "&matrix=", compartment, "&year=2025"
  )
}

logfile <- function() {
  paste0("log/", gsub(" ", "_", series_id), "_", compartment, "_log.txt")
}

sink_to_logfile <- function() {
  con <- file(logfile())
  sink(con, append = TRUE)
  sink(con, type = "message", append = TRUE)
}


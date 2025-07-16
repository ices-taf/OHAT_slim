library(TAF)

# Use this for testing
if (FALSE) {
  series_id <- "13704 AS Gadus morhua LI"
  # series_id <- "7884 CD Limanda limanda LI"
  compartment <- "biota"
  year <- 2025
}

clean_series_id <- function(series_id) {
  gsub(" ", "_", series_id)
}

outfile <- function(series_id, compartment, year) {
  paste0(
    paste(
      clean_series_id(series_id), compartment, year,
      sep = "__"
    ), ".html"
  )
}

open_logfile <- function(series_id, compartment, year) {
  con <-
    file(
      paste0(
        "log/",
        clean_series_id(series_id), "_", compartment, "_log.txt"
      )
    )

  sink(con, append = TRUE)
  sink(con, type = "message", append = TRUE)

  # print log file header
  TAF::msg("Starting assessment platform for OHAT ", year)
  TAF::msg("To test, try: ", paste0(
    "https://dome.ices.dk/ohat/Home/GettrResult?seriesID=", gsub(" ", "%20", series_id),
    "&matrix=", compartment, "&year=", year
  ))
}

close_logfile <- function() {
  # print state of session and close
  TAF::taf.session()
  closeAllConnections()
}

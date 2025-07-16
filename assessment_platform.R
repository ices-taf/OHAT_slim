# to live test:
# https://tafinternal.ices.dk/worker2/OAT/13704%20AS%20Gadus%20morhua%20LI/biota/2025

# source utils
source("utilities.R")

# get arguments
series_id <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]

# add logging
sink_to_logfile()

# load libraries
library(TAF)
library(lattice)
library(grid)
library(rmarkdown)
library(dplyr)
library(data.table)
# Load the package harsat 1.0.3
taf.library(harsat)


# print log file header
msg("Starting assessment platform for OHAT 2025")
msg("To test, try: ", calling_url())

msg("Using harsat version:", capture.output(packageVersion("harsat")))

msg("reading data")
assessment <- readRDS(paste0(compartment, ".rds"))

msg("running report")
harsat::report_assessment(
  assessment,
  subset = series == series_id,
  output_dir = "html",
  output_file = paste(gsub(" ", "_", series_id), compartment, "2025.html", sep = "__")
)

TAF::taf.session()

msg("DONE!")

# close log connection
closeAllConnections()


#Use this for testing
if (FALSE) {

  series_id <- "13704 AS Gadus morhua LI"
  #series_id <- "7884 CD Limanda limanda LI"
  compartment <- "biota"

  harsat::report_assessment(
    assessment <- readRDS(paste0(compartment, ".rds")),
    subset = series == series_id,
    output_dir = "html",
  output_file = paste(gsub(" ", "_", series_id), compartment, "2025.html", sep = "__")
  )

}
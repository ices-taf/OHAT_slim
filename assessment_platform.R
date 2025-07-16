# get arguments
series_id <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]
year <- 2025

# source utils
source("utilities.R")

# add logging
sink_to_logfile(series_id, compartment, year)

# Load the package harsat 1.0.3
TAF::taf.library(harsat)

assessment <- readRDS(paste0(compartment, ".rds"))

harsat::report_assessment(
  assessment,
  subset = series == series_id,
  output_dir = "html",
  output_file = outfile(series_id, compartment, year)
)

close_logfile()

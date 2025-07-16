# get arguments
series_id <- commandArgs(trailingOnly = TRUE)[1]
compartment <- commandArgs(trailingOnly = TRUE)[2]
year <- 2025

# source utils and setup
source("utilities_and_setup.R")

# Load the package harsat 1.0.3
TAF::taf.library(harsat)

assessment <- readRDS(file.path("boot/data/assessment_data", paste0(compartment, ".rds")))

harsat::report_assessment(
  assessment,
  subset = series == series_id,
  output_dir = "html",
  output_file = outfile(series_id, compartment, year)
)

close_logfile()

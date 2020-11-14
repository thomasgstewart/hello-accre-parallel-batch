# Grab simulation argument
args <- commandArgs(trailingOnly = TRUE)
args <- as.numeric(args)

# Load packages
.libPaths("~/R/rlib")
source("01-functions.R")
sim_settings <- readRDS("sim-settings.RDS")

# Select row of sim
params <- readRDS("sim-settings.RdS")[args,] %>% as.list

# Set seed
set.seed(args)

# Simulation
sim_settings[args, c("miss_left", "capture", "miss_right")] <- repM(params)

# Save to file
outfile <- "./results/sim-results-" %|% Sys.Date() %|% "-" %|% sprintf("%03.0f", args) %|% ".rds"
saveRDS(sim_settings[args, ], file = outfile)

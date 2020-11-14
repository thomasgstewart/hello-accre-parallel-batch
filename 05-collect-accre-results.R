# Creates a single data.table with all the simulation results from the same date
setwd("./results")
f1 <- list.files(pattern = "sim-results-[0-9]{4}-[0-9]{2}-[0-9]{2}")
f2 <- lapply(f1, readRDS)
f3 <- data.table::rbindlist(f2)
setwd("..")
filename <- gsub("(.{22}).*", "\\1\\.RDS", sort(f1)[1])
saveRDS(f3, filename)

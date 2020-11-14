require(magrittr)

# Creates a single data.table with all the simulation results from the same date
setwd("./results")
f1 <- list.files(pattern = "sim-results-")
f2 <- lapply(f1, readRDS)
f3 <- data.table::rbindlist(f2)
setwd("..")

date_time <- Sys.time() %>% format(format = "%Y-%m-%d-%H-%M-%S")
"sim-results-DATE.RDS" %>% 
  gsub("DATE",date_time,.) %>%
  saveRDS(f3, .)

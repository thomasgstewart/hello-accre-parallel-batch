source("01-functions.R")
sim_settings <- readRDS("sim-settings.RDS")

# Create parallel backend
require(doParallel)
cores_2_use <- detectCores() - 1
cl <- makeCluster(cores_2_use)
clusterSetRNGStream(cl, 2344)
registerDoParallel(cl)

g <- foreach(
    i = 1:nrow(sim_settings)
  , .combine = rbind
  , .packages = "magrittr"
) %dopar% {
  sim_settings[i,c("miss_left", "capture", "miss_right")] <- sim_settings[i,] %>% as.list %>% Mreps
  sim_settings[i,]
}
stopCluster(cl)

# Save results
date_time <- Sys.time() %>% format(format = "%Y-%m-%d-%H-%M-%S",.)
"sim-results-DATE.RDS" %>% 
  gsub("DATE",date_time) %>% 
  saveRDS(g, .)
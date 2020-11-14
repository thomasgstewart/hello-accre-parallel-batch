sim_settings <- expand.grid(
    M = 5000
  , N = c(30, 100, 200, 1000)
  , shape = c(0.5, 1, 2, 3)
  , scale = 1:5
  , miss_left = NA
  , capture = NA
  , miss_right = NA
  , KEEP.OUT.ATTRS = FALSE
  , stringsAsFactors = FALSE
  )


saveRDS(sim_settings, "sim-settings.RDS")

# CLT Shortcut on skewed data

generate_data <- function(params){
  params$data <- with(params,{
    rgamma(N, shape = shape, scale = scale)
  })
  params
}

analysis <- function(params){
  params$ci <- t.test(params$data)$conf.int
  params
}

capture <- function(params){
  true_mean <- params$shape*params$scale
  if(params$ci[1] >= true_mean){
    -1
  }else if(params$ci[2] <= true_mean){
    1
  }else{
    0
  }
}

Mreps <- function(params){
  replicate(params$M, params %>% generate_data %>% analysis %>% capture) %>% 
    factor(levels = c(-1,0,1)) %>% table
}

`%|%` <- function(a,b) paste0(a,b)
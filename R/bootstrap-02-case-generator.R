
# load library
library("boot")

# load data
simdata <- read.csv("/home/rstudio/data/pathological-example2.csv")

# function to obtain regression weights 
bs <- function(formula, data, indices) {
  d <- data[indices,] # allows boot to select sample 
  fit <- lm(formula, data=d)
  return(coef(fit)) 
} 

bcis <- c()
seeds <- c(1:10)

for (seed in seeds) {
  set.seed(seed)
  # bootstrapping with many replications 
  results <- boot(data=simdata, statistic=bs, 
                  R=1000, formula=y~1+x)
  
  bci <- boot.ci(results,type="bca", index=2) # b estimate
  print(bci)
  
  bcis <- rbind(bcis,bci$bca)
}

#save(bci,file = paste0("results",".Rda"))

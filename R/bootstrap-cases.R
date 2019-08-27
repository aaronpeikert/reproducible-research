
# load library
library("boot")

# load data
simdata <- read.csv("data/pathological-example2.csv")

# function to obtain regression weights 
bs <- function(formula, data, indices) {
  d <- data[indices,] # allows boot to select sample 
  fit <- lm(formula, data=d)
  return(coef(fit)) 
} 

bcis <- c() # initialise empty vector for loop
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
bcis <- data.frame(conf = bcis[,1],
                   seed = seeds,
                   lower = bcis[,4],
                   upper = bcis[,5])
write.csv(bcis,
          paste0("data/bcis-", R.version$major, ".", R.version$minor, ".csv"))
#save(bci,file = paste0("results",".Rda"))

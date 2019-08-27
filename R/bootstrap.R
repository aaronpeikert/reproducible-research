#----boot-library----
library("boot")

#----load-data----
simdata <- read.csv("../data/pathological-example2.csv")

#----define-function----
# function to obtain regression weights 
bs <- function(formula, data, indices) {
  d <- data[indices,] # allows boot to select sample 
  fit <- lm(formula, data=d)
  return(coef(fit)) 
}

#-----find-seed----
bcis35 <- read.csv("../data/bcis-3.5.0.csv")
bcis36 <- read.csv("../data/bcis-3.6.1.csv")
sig_seed35 <- bcis35$seed[!(bcis35$lower < 0)&(bcis35$upper > 0)]
sig_seed36 <- bcis36$seed[!(bcis36$lower < 0)&(bcis36$upper > 0)]
seeds <- setdiff(sig_seed35, sig_seed36)
seed <- seeds[1]

#----bootstrap----
R.version$version.string
set.seed(seed)
results <- boot(data=simdata, statistic=bs, 
                  R=1000, formula=y~1+x)
  
# get beta estimates' confidence intervals
bci <- boot.ci(results,type="bca", index=2) # b estimate
print(bci)

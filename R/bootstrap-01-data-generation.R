#
# generate dataset for pathological non-replication
# of bootstrap CI-based decisions
#
# run on R 3.6.1

# generate data and make permanent
set.seed(1234)  
x <- rnorm(100)
y <- rnorm(100)

y <- y + .225*x

x <- round(x,2)
y <- round(y,2)

simdata <- data.frame(x,y)

write.csv(file = "../data/pathological-example2.csv", 
          x=simdata, quote=FALSE, row.names = FALSE)
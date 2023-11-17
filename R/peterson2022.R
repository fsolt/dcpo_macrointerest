library(pacman)
# load all the packages you will use below 
p_load(
  tidyverse,
  here,
  rio
) 


source(here("data", "peterson2022", "Extract.r"))

# load data

macroint2 <- import(here("data", "peterson2022", "calc2.dta"))

# make the date variable in the right format

macroint2$date2 <- ISOdate(macroint2$year, macroint2$month, 1)

# bootstrap

set.seed(96345)

n.boot <- 1000  #number of iterations

boot.est <-
  matrix(NA, nrow = 168, ncol = n.boot) #create the empty matrix that the results will go in.  nrow is the number of final time points

for (i in 1:n.boot) {
  #make the new "index" which is the input to the calc algorithm.  This is a draw from a random normal with mean and sd based on real results
  macroint2$index4 <-
    rnorm(349 , mean = macroint2$index3, sd = sqrt(((macroint2$ncases * macroint2$index) * (1 - macroint2$index) ^ 2 + (macroint2$ncases * (1 - macroint2$index)) * (0 - macroint2$index) ^ 2) / (macroint2$ncases - 1)))
  #run calc.  Save the outout as "object"
  object <-
    extract(
      macroint2$varname,
      as.Date(macroint2$date2),
      macroint2$index4,
      macroint2$ncases,
      unit = "Q",
      begindt = ISOdate(1973, 1, 1),
      enddt = NA
    )
  #add the measure of the macrointerest measure to the appropriate col of the boot.est
  boot.est[, i] <- object$latent1
  #read in the data with the surveys by house
}

##pull out the mean and sd of bootstrapped results
MI.est <-
  matrix(NA, nrow = 168, ncol = 4) #create the empty matrix that the results will go in.  nrow is the number of final time points
MI.est[, 1] <- interestQ$period
MI.est[, 2] <- interestQ$latent1
MI.est[, 3] <- apply(boot.est, 1, mean)
MI.est[, 4] <- apply(boot.est, 1, sd)

#output to be added to stata file.

MI <- as.data.frame(MI.est)

saveRDS(MI, here("data", "peterson2022", "peterson_mi.rds"))
# father involvement in time structuring tasks, empty model


# if running directly from file and not sourcing:
# setwd("~/Dropbox/Fatherinvolv_jmf_s1/revise fatherinvol - Sociological Science/data")
# pacman::p_load(mcmcplots,mvtnorm,R2jags,rjags,coda,foreign,plyr,mice,Hmisc) 
# load("data/ggs.mf_011216.RData")


# load data
X <- subset(ggs.resp, select=c(country, fistr))
X <- X[order(X$country),]

# transform countries to integers
X$country2 <- mapvalues(X$country, from=c("Australia", "Austria", "Belgium", "Bulgaria", 
                                          "CzechRepublic", "Estonia", "France", "Georgia", 
                                          "Germany", "Hungary", "Italy", "Lithuania",  
                                          "Netherlands", "Norway", "Poland", "Romania",
                                          "Russia"),
                        to=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17))
X$country <- as.integer(X$country2)

# remove cases missing country
X <- X[!is.na(X$country),] # not applicable bc all cases have a country

test <- mice(X, m=5 ) # this didn't work. try with complete cases
Y <- test$data # this is actually unimputed data... but for some reason it works with this data but not with X. Why?
# Y <- X

# sample size
J <- length(unique(Y$country)) # number of countries
N <- length(Y$fistr) # number of people

# amount of iterations and burn-in period
itt <- 10000
bi <- 1000





### input files JAGS ###
data <- list(ficon = Y$fistr, country = Y$country, J = J, N = N)


inits1 <- list(tau = 1, mu.alpha =  1, tau.alpha = 1)
inits2 <- list(tau = 2, mu.alpha = 2, tau.alpha = 2)

inits <- list(inits1, inits2)



fistr_basic <- jags(data, inits, model.file = "analyses/model/model_basic_280715.R",
                    parameters  = c("alpha", "sigma.1", "sigma.2", "ICC"), 
                    n.chains = 2, n.iter = itt, n.burnin = bi, n.thin = 10)


save(fistr_basic, file="analyses/results/fistr_basic_160118.RData")
# load("analyses/results/fistr_basic_160118.RData")

# visual diagnoses
fistr_basic_mcmc <- as.mcmc(fistr_basic)
sum <- summary(fistr_basic_mcmc)
# traceplot(fistr_basic)

ICCmean <- sum$statistics[c(1), 1] # .24

quants12 <- HPDinterval(fistr_basic_mcmc)
quants1 <- quants12[[1]]

# table of results
coefficients <- (sum$statistics[c(1,20:21), 1])
quantiles <- (quants1[c(1,20:21),c(1,2)])
analysisresults.fistr_basic <- as.data.frame(cbind(coefficients, quantiles))
analysisresults.fistr_basic$var <- c("ICC", "level1 var", "level2 var")

save(analysisresults.fistr_basic, file="analyses/results/analysisresults.fistr_basic_160118.RData")
load("analyses/results/analysisresults.fistr_basic_160118.RData")
View(analysisresults.fistr_basic)


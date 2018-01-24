model{
  
  # Main model level 1
  
  for (i in 1:N){
    ficon[i] ~ dnorm(mu[i], tau)
    mu[i] <- alpha[country[i]]
  }
  
  # Priors level 1 
  
  tau ~ dgamma(.01, .01)
  
  # Main model level 2
  
  for (j in 1:J){
    alpha[j] ~ dnorm(mu.alpha, tau.alpha)
  }
  
  # Priors level 2
  
  mu.alpha ~ dnorm(0,.01)
  tau.alpha ~ dgamma(.1,.1)
  
  sigma.1 <- 1.0/sqrt(tau)
  sigma.2 <- 1.0/sqrt(tau.alpha)
  
  ICC <- sigma.2 / (sigma.1+sigma.2)
  
}

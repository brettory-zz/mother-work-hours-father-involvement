model{
  
  # Main model level 1
  
  for (i in 1:N){
    ficon[i] ~ dnorm(mu[i], tau[country[i]])
      mu[i] <- beta1[country[i]]*hrwkMom[i] + beta2*femedu[i] +
               beta3*age[i] + beta4*edu[i] + beta5*numkids[i] + 
               beta6*under4[i] + beta7*female[i] + alpha[country[i]]
    
    hrwkMom[i] ~ dnorm(-0.98, 0.01)
    femedu[i] ~ dnorm(0.13, 0.84)
    age[i] ~ dnorm(-5.08, 0.02)
    edu[i] ~ dnorm(0.06, 0.84)
    under4[i] ~ dbern(0.31)
  }
  
  
  # Main model level 2
  
  for (j in 1:J){
    beta1[j] ~ dnorm(mu.b1, tau.b1)
    tau[j] ~ dgamma(tau.a, tau.b)
    alpha[j] ~ dnorm(mu.alpha, tau.alpha) 
  }
  
  
  
  # Priors 
  tau.a ~ dgamma(1, 1)
  tau.b ~ dgamma(1, 1)
  tau.b1 ~ dgamma(1, 1)
  mu.alpha ~ dnorm(0, .01)
  mu.b1 ~ dnorm(0, .01)
  tau.alpha ~ dgamma(1, 1)
  
  beta2 ~ dnorm(0, .01)
  beta3 ~ dnorm(0, .01)
  beta4 ~ dnorm(0, .01)
  beta5 ~ dnorm(0, .01)
  beta6 ~ dnorm(0, .01)
  beta7 ~ dnorm(0, .01)

  sigma.b <- 1/(tau.b)
  sigma.b1 <- 1/(tau.b1)
  sigma.alpha <- 1/(tau.alpha)
  
}

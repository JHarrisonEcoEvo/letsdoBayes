//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

//  https://vasishth.github.io/bayescogsci/book/sec-firststan.html
//  http://hedibert.org/wp-content/uploads/2021/02/stan-rstan-examples.html
data {
  int n;                 // number of observations
  real y[n];             // simulated data       
}

parameters {
  real mu;               // mean
  real<lower=0> sigma;   // standard deviation
}

model {
  // likelihood
  for(i in 1:n) {
    y[i] ~ normal(mu,sigma);
  }  
  
  // priors
  mu ~ normal(2, 1);
  sigma ~ exponential(1);
}

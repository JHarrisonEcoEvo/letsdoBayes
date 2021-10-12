//https://vasishth.github.io/bayescogsci/book/sec-firststan.html
//http://hedibert.org/wp-content/uploads/2021/02/stan-rstan-examples.html
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


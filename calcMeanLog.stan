data {
  int<lower = 1> N;  // Our sample size
  vector[N] y;  // Our data (a vector)
}

parameters {
  real mu;
  real<lower=0> sigma;
}

model {
  // Priors:
  target += normal_lpdf(mu | 0, 20);
  target += lognormal_lpdf(sigma | 3, 1);
  // Likelihood:
  for(i in 1:N)
    target += normal_lpdf(y[i] | mu, sigma);
}

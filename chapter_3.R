# Chapter 3
p_grid <- seq( from=0 , to=1 , length.out=1000 )
prior <- rep( 1 , 1000 )
likelihood <- dbinom( 6 , size=9 , prob=p_grid )
posterior <- likelihood * prior
posterior <- posterior / sum(posterior)
set.seed(100)
samples <- sample( p_grid , prob=posterior , size=1e4 , replace=TRUE )

hist(samples)

# 3E1
sum(samples[p_grid < 0.2]) / 1e4
# 0.1258482

# 3E2
sum(samples[p_grid > 0.8]) / 1e4
# 0.1281592

# 3E3
sum(samples[p_grid > 0.2 & p_grid < 0.8]) / 1e4
# 0.3807948

# 3E4
quantile(samples, 0.2)
# 0.5185185 

# 3E5
quantile(samples, 0.8)
# 0.7557558

# 3E6
HPDI(samples, 0.66)
# 0.5085085 0.7737738

# 3E7
PI(samples, 0.66)
# 0.5025025 0.7697698

# 3M1
p_grid <- seq( from=0 , to=1 , length.out=1000 )
prior <- rep( 1 , 1000 )
likelihood <- dbinom( 8 , size=15 , prob=p_grid )
posterior <- likelihood * prior
posterior <- posterior / sum(posterior)
set.seed(100)
samples <- sample( p_grid , prob=posterior , size=1e4, replace=TRUE)
hist(samples)

plot(p_grid, posterior, type='b')

# 3M2
HPDI(samples, 0.9)
# 0.3343343 0.7217217 

# 3M3
p_grid <- seq( from=0 , to=1 , length.out=1000 )
prior <- rep( 1 , 1000 )
likelihood <- dbinom( 8 , size=15 , prob=p_grid )
posterior <- likelihood * prior
posterior <- posterior / sum(posterior)
set.seed(100)
samples <- sample( p_grid , prob=posterior , size=1e4, replace=TRUE)

w15 <- rbinom(1e4, size=15, prob=samples)

table(w15)/1e4
plot(table(w15)/1e4)

# 0.1499

# 3M4
w9 <- rbinom(1e4, size=9, prob=samples)
table(w9/1e4)

# 0.1842

# 3M5

p_grid <- seq( from=0 , to=1 , length.out=1000 )
prior <- ifelse( p_grid < 0.5 , 0 , 1 )
likelihood <- dbinom( 8 , size=15 , prob=p_grid )
posterior <- likelihood * prior
posterior <- posterior / sum(posterior)
set.seed(100)
samples <- sample( p_grid , prob=posterior , size=1e4, replace=TRUE)
hist(samples)

plot(p_grid, posterior, type='b')

# 3M5.2
HPDI(samples, 0.9)
# 0.5005005 0.7097097

# 3M5.3
w15 <- rbinom(1e4, size=15, prob=samples)
table(w15)/1e4
plot(table(w15)/1e4)

# 3M5.4
w15 <- rbinom(1e4, size=9, prob=samples)
table(w15)/1e4
plot(table(w15)/1e4)

# 3M6

n = 1e5
p_grid <- seq( from=0 , to=1 , length.out=n )
prior <- rep( 1 , n )

sample_size

likelihood <- dbinom( , size=1000 , prob=p_grid )
posterior <- likelihood * prior
posterior <- posterior / sum(posterior)
# set.seed(100)
samples <- sample( p_grid , prob=posterior , size=1e5 , replace=TRUE )

hist(samples)

pi <- PI(samples, prob=0.99)
pi
abs(pi[2] - pi[1])
abs(pi[2] - pi[1]) <= 0.05

# define grid
p_grid <- seq( from=0 , to=1 , length.out=100)
# define prior
# prior <- rep( 1 , 30 )
# prior <- ifelse( p_grid < 0.5 , 0 , 1 )
prior <- dbinom(1, size = 2, prob = p_grid)
# prior <- exp( -5*abs( p_grid - 0.5 ) )
# compute likelihood at each value in grid
likelihood <- dbinom( 0 , size= 2, prob=p_grid )
# compute product of likelihood and prior
unstd.posterior <- likelihood * prior
# standardize the posterior, so it sums to 1
posterior <- unstd.posterior / sum(unstd.posterior)

plot( p_grid , likelihood  , type="b" ,
      xlab="probability of water" , ylab="posterior probability" )
mtext( "100 points" )
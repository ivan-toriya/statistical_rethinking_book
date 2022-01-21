R Notebook
================

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you
execute code within the notebook, the results appear beneath the code.

Try executing this chunk by clicking the *Run* button within the chunk
or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*.

``` r
plot(cars)
```

![](grid_approximation_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or
by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output
will be saved alongside it (click the *Preview* button or press
*Ctrl+Shift+K* to preview the HTML file).

The preview shows you a rendered HTML copy of the contents of the
editor. Consequently, unlike *Knit*, *Preview* does not run any R code
chunks. Instead, the output of the chunk when it was last run in the
editor is displayed.

``` r
# define grid
p_grid <- seq( from=0 , to=1 , length.out=20)

# define prior
# prior <- rep( 1 , 30 )
# prior <- ifelse( p_grid < 0.5 , 0 , 1 )
prior <- dbinom(1, size = 2, prob = p_grid)
# prior <- exp( -5*abs( p_grid - 0.5 ) )

# compute likelihood at each value in grid
likelihood <- dbinom( 1 , size= 2, prob=p_grid )

# compute product of likelihood and prior
unstd.posterior <- likelihood * prior

# standardize the posterior, so it sums to 1
posterior <- unstd.posterior / sum(unstd.posterior)


plot( p_grid , likelihood  , type="b" ,
      xlab="probability of water" , ylab="posterior probability" )
mtext( "100 points" )
```

![](grid_approximation_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

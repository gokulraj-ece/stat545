Gapminder, ggplot2 and dplyr single table verbs
================
Gokul Raj
September 27, 2016

Blah blah
---------

Let's make scatterplots

``` r
library(tidyverse) #gets me ggplot2
```

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

``` r
library(gapminder)

ggplot(gapminder , aes(x = gdpPercap, y = lifeExp)) # won't plot anything
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-1-1.png)

``` r
p <- ggplot(gapminder , aes(x = gdpPercap, y = lifeExp))

## add points
p + geom_point()
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-1-2.png)

``` r
## let's log the x axis (brute force)
p <- ggplot(gapminder , aes(x = log10(gdpPercap), y = lifeExp))
p + geom_point()
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-1-3.png)

``` r
# a better way
p <- ggplot(gapminder , aes(x = gdpPercap, y = lifeExp))
p + scale_x_log10() + geom_point()
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-1-4.png)

``` r
## let's save that
p <- ggplot(gapminder , aes(x = gdpPercap, y = lifeExp)) + scale_x_log10()
p + geom_point()
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-1-5.png)

``` r
##color by continent
p + geom_point(aes(color = continent)) ## mapping an aesthetic
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-1-6.png)

``` r
##deal with overplotting
p + geom_point(alpha = 1/3 , size = 3) ## setting an aesthetic
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-1-7.png)

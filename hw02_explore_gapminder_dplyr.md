hw02\_explore-gapminder-dplyr
================
Gokul Raj Suresh Kumar
2016-09-27

Explore Gapminder with dplyr
============================

Bringing rectangular data in
----------------------------

#### Loading the gapminder and dplyr packages

``` r
suppressPackageStartupMessages(library(dplyr))
library(gapminder)
```

Smell testing the data
----------------------

#### Displaying a tibble

``` r
gapminder
```

    ## # A tibble: 1,704 × 6
    ##        country continent  year lifeExp      pop gdpPercap
    ##         <fctr>    <fctr> <int>   <dbl>    <int>     <dbl>
    ## 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
    ## 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
    ## 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
    ## 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
    ## 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
    ## 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
    ## 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
    ## 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
    ## 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
    ## 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
    ## # ... with 1,694 more rows

-   A `data.frame` is a list of vectors of equal length.
-   Printing the `gapminder` object prints a tibble.
-   A tibble is a `data.frame` reimagined to retrieve just the effective information.

#### Determining the class

``` r
class(gapminder)
```

    ## [1] "tbl_df"     "tbl"        "data.frame"

-   The `gapminder` object is a regular data frame.
-   It is a tibble as well.

#### Determining the number of variables

``` r
ncol(gapminder)
```

    ## [1] 6

#### Determining the number of observations

``` r
nrow(gapminder)
```

    ## [1] 1704

#### Alternate ways of determining the size

``` r
dim(gapminder)
```

    ## [1] 1704    6

-   The 2 functions described in the subsequent section can also be considered as alternate ways of determining the size.

#### Determining the flavour of each variable

``` r
str(gapminder)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    1704 obs. of  6 variables:
    ##  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
    ##  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
    ##  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
    ##  $ pop      : int  8425333 9240934 10267083 11537966 13079460 14880372 12881816 13867957 16317921 22227415 ...
    ##  $ gdpPercap: num  779 821 853 836 740 ...

``` r
glimpse(gapminder)
```

    ## Observations: 1,704
    ## Variables: 6
    ## $ country   <fctr> Afghanistan, Afghanistan, Afghanistan, Afghanistan,...
    ## $ continent <fctr> Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asi...
    ## $ year      <int> 1952, 1957, 1962, 1967, 1972, 1977, 1982, 1987, 1992...
    ## $ lifeExp   <dbl> 28.801, 30.332, 31.997, 34.020, 36.088, 38.438, 39.8...
    ## $ pop       <int> 8425333, 9240934, 10267083, 11537966, 13079460, 1488...
    ## $ gdpPercap <dbl> 779.4453, 820.8530, 853.1007, 836.1971, 739.9811, 78...

1.  *country* is of type *Factor*.
2.  *continent* is of type *Factor*.
3.  *year* is of type *int*.
4.  *lifeExp* is of type *num*.
5.  *pop* is of type *int*.

Exploring individual variables
------------------------------

Factor and Figure Management
================
Gokul Raj Suresh Kumar
2016-10-20

Factor and Figure Management
============================

#### Loading the required packages

``` r
library(gapminder)
library(tidyverse)
library(forcats)
```

Factor Management
-----------------

### Drop Oceania

#### Gapminder's details

``` r
gapminder %>% 
  count( continent )
```

    ## # A tibble: 5 × 2
    ##   continent     n
    ##      <fctr> <int>
    ## 1    Africa   624
    ## 2  Americas   300
    ## 3      Asia   396
    ## 4    Europe   360
    ## 5   Oceania    24

``` r
nrow( gapminder )
```

    ## [1] 1704

``` r
nlevels( gapminder$continent )
```

    ## [1] 5

``` r
nlevels( gapminder$country )
```

    ## [1] 142

#### Oceania's details

``` r
just_oceania <- gapminder %>%
  filter( continent == "Oceania" ) %>%
  droplevels()
just_oceania %>%
  count( continent )
```

    ## # A tibble: 1 × 2
    ##   continent     n
    ##      <fctr> <int>
    ## 1   Oceania    24

``` r
nlevels( just_oceania$continent )
```

    ## [1] 1

``` r
nlevels( just_oceania$country )
```

    ## [1] 2

#### Details after dropping Oceania

``` r
without_oceania <- gapminder %>%
  filter( continent != "Oceania" ) %>%
  droplevels()
without_oceania %>%
  count( continent )
```

    ## # A tibble: 4 × 2
    ##   continent     n
    ##      <fctr> <int>
    ## 1    Africa   624
    ## 2  Americas   300
    ## 3      Asia   396
    ## 4    Europe   360

``` r
nrow( without_oceania )
```

    ## [1] 1680

``` r
nlevels( without_oceania$continent )
```

    ## [1] 4

``` r
nlevels( without_oceania$country )
```

    ## [1] 140

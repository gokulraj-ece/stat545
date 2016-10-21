Factor and Figure Management
================
Gokul Raj Suresh Kumar
2016-10-21

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

### Dropping Oceania

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

#### Oceania's details (for manual validation)

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
nrow( just_oceania )
```

    ## [1] 24

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
# Dropping Oceania and it's factor levels
(without_oceania <- gapminder %>%
  filter( continent != "Oceania" ) %>%
  droplevels())
```

    ## # A tibble: 1,680 × 6
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
    ## # ... with 1,670 more rows

``` r
# The tibble shows that Oceania has been removed
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
# 1704 - 24 (Observations for all continents - Observations for Oceania)
nrow( without_oceania )
```

    ## [1] 1680

``` r
# 5 - 1 (All continents - Oceania)
nlevels( without_oceania$continent )
```

    ## [1] 4

``` r
# 142 - 2 (All countries - (New Zealand + Australia))
nlevels( without_oceania$country )
```

    ## [1] 140

### Reordering the levels of `country`

#### Extracting maximum population of Countries in Europe (between 1952 and 2007)

``` r
europe_max_pop <- gapminder %>%
  filter( continent == "Europe" ) %>%
  group_by( country ) %>% 
  summarize( max_pop = max( pop ) ) %>%
  droplevels()

head( europe_max_pop )
```

    ## # A tibble: 6 × 2
    ##                  country  max_pop
    ##                   <fctr>    <int>
    ## 1                Albania  3600523
    ## 2                Austria  8199783
    ## 3                Belgium 10392226
    ## 4 Bosnia and Herzegovina  4552198
    ## 5               Bulgaria  8971958
    ## 6                Croatia  4494013

``` r
nrow( europe_max_pop )
```

    ## [1] 30

``` r
europe_max_pop$country %>%
  levels() %>%
  head()
```

    ## [1] "Albania"                "Austria"               
    ## [3] "Belgium"                "Bosnia and Herzegovina"
    ## [5] "Bulgaria"               "Croatia"

``` r
europe_max_pop %>% 
  ggplot( aes( x = max_pop , y = country ) ) + geom_point()
```

![](hw05_factor-figure-management_files/figure-markdown_github/unnamed-chunk-5-1.png)

#### Reordering factor levels of European countries based on descending order of maximum population

``` r
pop_desc_reorder <- fct_reorder( europe_max_pop$country , europe_max_pop$max_pop , .desc = TRUE ) %>%
  levels()

head(pop_desc_reorder)
```

    ## [1] "Germany"        "Turkey"         "France"         "United Kingdom"
    ## [5] "Italy"          "Spain"

#### Exploring the effects of `arrange()`

``` r
pop_desc_data <- europe_max_pop %>% arrange( desc( max_pop ) ) 

head(pop_desc_data)
```

    ## # A tibble: 6 × 2
    ##          country  max_pop
    ##           <fctr>    <int>
    ## 1        Germany 82400996
    ## 2         Turkey 71158647
    ## 3         France 61083916
    ## 4 United Kingdom 60776238
    ## 5          Italy 58147733
    ## 6          Spain 40448191

``` r
pop_desc_data$country %>% 
  levels() %>% 
  head()
```

    ## [1] "Albania"                "Austria"               
    ## [3] "Belgium"                "Bosnia and Herzegovina"
    ## [5] "Bulgaria"               "Croatia"

``` r
pop_desc_data %>%
  ggplot( aes( x = max_pop , y = country ) ) + geom_point()
```

![](hw05_factor-figure-management_files/figure-markdown_github/unnamed-chunk-7-1.png)

#### Exploring the effects of reordering a factor( without `arrange()`)

``` r
europe_max_pop$country %>%
  levels() %>%
  head()
```

    ## [1] "Albania"                "Austria"               
    ## [3] "Belgium"                "Bosnia and Herzegovina"
    ## [5] "Bulgaria"               "Croatia"

``` r
europe_max_pop %>% 
  ggplot( aes( x = max_pop , y = fct_reorder( country,max_pop ) ) ) + geom_point()
```

![](hw05_factor-figure-management_files/figure-markdown_github/unnamed-chunk-8-1.png)

#### Exploring the effects of factor reordering with `arrange()`

``` r
head(pop_desc_data)
```

    ## # A tibble: 6 × 2
    ##          country  max_pop
    ##           <fctr>    <int>
    ## 1        Germany 82400996
    ## 2         Turkey 71158647
    ## 3         France 61083916
    ## 4 United Kingdom 60776238
    ## 5          Italy 58147733
    ## 6          Spain 40448191

``` r
pop_desc_data %>% 
  ggplot( aes( x = max_pop, y = fct_reorder( country,max_pop ) ) ) + geom_point()
```

![](hw05_factor-figure-management_files/figure-markdown_github/unnamed-chunk-9-1.png)

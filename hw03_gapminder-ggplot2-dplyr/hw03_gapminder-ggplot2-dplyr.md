Gapminder, ggplot2 and dplyr single table verbs
================
Gokul Raj Suresh Kumar
2016-10-03

Manipulate and Explore Gapminder with dplyr & ggplot2
=====================================================

Bringing rectangular data in
----------------------------

#### Loading the tidyverse and gapminder packages

``` r
library(tidyverse)
library(gapminder)
```

Tasks
-----

#### Maximum and Minimum of `gdpPercap` for all continents

``` r
my_gap <- gapminder

gdp_data <- my_gap %>% 
  group_by(continent) %>% 
  summarize(min_gdp_percap = min(gdpPercap), max_gdp_percap = max(gdpPercap))

knitr::kable(gdp_data)
```

| continent |  min\_gdp\_percap|  max\_gdp\_percap|
|:----------|-----------------:|-----------------:|
| Africa    |          241.1659|          21951.21|
| Americas  |         1201.6372|          42951.65|
| Asia      |          331.0000|         113523.13|
| Europe    |          973.5332|          49357.19|
| Oceania   |        10039.5956|          34435.37|

``` r
gdp_data %>%
  ggplot(aes(x = continent , y = min_gdp_percap )) + 
  geom_point( aes(color = continent) , size = 4)
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
gdp_data %>%
  ggplot(aes(x = continent , y = max_gdp_percap )) + 
  geom_point( aes(color = continent) , size = 4)
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-3-2.png)

#### Spread of `gdpPercap` within the continents

``` r
spread_data <- my_gap %>%
  group_by(continent) %>% 
  summarize( spread_by_continent = (max(gdpPercap) - min(gdpPercap)))

knitr::kable(spread_data)
```

| continent |  spread\_by\_continent|
|:----------|----------------------:|
| Africa    |               21710.05|
| Americas  |               41750.02|
| Asia      |              113192.13|
| Europe    |               48383.66|
| Oceania   |               24395.77|

``` r
spread_data %>%
  ggplot(aes(x = continent , y = spread_by_continent )) + 
  geom_point( aes(color = continent) , size = 4)
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-5-1.png)

#### Life expectancy over time for different continents

``` r
expectancy_data <- my_gap %>%
  select(continent , lifeExp , year) %>%
  filter(year %in% c(1957, 1967, 1977, 1987, 1997, 2007)) %>% 
  group_by(continent , year) %>% 
  summarise(avg_life_exp = mean(lifeExp)) %>% 
  print(n = 10)
```

    ## Source: local data frame [30 x 3]
    ## Groups: continent [?]
    ## 
    ##    continent  year avg_life_exp
    ##       <fctr> <int>        <dbl>
    ## 1     Africa  1957     41.26635
    ## 2     Africa  1967     45.33454
    ## 3     Africa  1977     49.58042
    ## 4     Africa  1987     53.34479
    ## 5     Africa  1997     53.59827
    ## 6     Africa  2007     54.80604
    ## 7   Americas  1957     55.96028
    ## 8   Americas  1967     60.41092
    ## 9   Americas  1977     64.39156
    ## 10  Americas  1987     68.09072
    ## # ... with 20 more rows

``` r
expectancy_data %>%
  ggplot(aes(x = year , y = avg_life_exp )) + 
  geom_point( aes(color = continent)) + geom_line( aes(group = continent, color = continent))
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-7-1.png)

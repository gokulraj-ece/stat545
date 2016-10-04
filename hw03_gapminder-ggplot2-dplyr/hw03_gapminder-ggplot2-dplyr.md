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
```

Tasks
-----

#### Maximum and Minimum of `gdpPercap` for all continents

``` r
my_gap <- gapminder
gdp_data <- my_gap %>% 
  group_by(continent) %>% 
  summarise(min_gdpPercap = min(gdpPercap), max_gdpPercap = max(gdpPercap))
knitr::kable(gdp_data)
```

| continent |  min\_gdpPercap|  max\_gdpPercap|
|:----------|---------------:|---------------:|
| Africa    |        241.1659|        21951.21|
| Americas  |       1201.6372|        42951.65|
| Asia      |        331.0000|       113523.13|
| Europe    |        973.5332|        49357.19|
| Oceania   |      10039.5956|        34435.37|

``` r
gdp_data %>% ggplot(aes(x = continent , y = min_gdpPercap )) + 
  geom_point( aes(color = continent) , size = 4)
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
gdp_data %>% ggplot(aes(x = continent , y = max_gdpPercap )) + 
  geom_point( aes(color = continent) , size = 4)
```

![](hw03_gapminder-ggplot2-dplyr_files/figure-markdown_github/unnamed-chunk-3-2.png)

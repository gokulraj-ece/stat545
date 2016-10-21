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

### Factor Management

#### Drop Oceania

``` r
##Before dropping Oceania
summary(gapminder)
```

    ##         country        continent        year         lifeExp     
    ##  Afghanistan:  12   Africa  :624   Min.   :1952   Min.   :23.60  
    ##  Albania    :  12   Americas:300   1st Qu.:1966   1st Qu.:48.20  
    ##  Algeria    :  12   Asia    :396   Median :1980   Median :60.71  
    ##  Angola     :  12   Europe  :360   Mean   :1980   Mean   :59.47  
    ##  Argentina  :  12   Oceania : 24   3rd Qu.:1993   3rd Qu.:70.85  
    ##  Australia  :  12                  Max.   :2007   Max.   :82.60  
    ##  (Other)    :1632                                                
    ##       pop              gdpPercap       
    ##  Min.   :6.001e+04   Min.   :   241.2  
    ##  1st Qu.:2.794e+06   1st Qu.:  1202.1  
    ##  Median :7.024e+06   Median :  3531.8  
    ##  Mean   :2.960e+07   Mean   :  7215.3  
    ##  3rd Qu.:1.959e+07   3rd Qu.:  9325.5  
    ##  Max.   :1.319e+09   Max.   :113523.1  
    ## 

``` r
nrow(gapminder)
```

    ## [1] 1704

``` r
nlevels(gapminder$continent)
```

    ## [1] 5

``` r
nlevels(gapminder$country)
```

    ## [1] 142

``` r
##Details of Oceania alone
just_oceania <- gapminder %>% filter(continent == "Oceania") %>% droplevels()
summary(just_oceania)
```

    ##         country     continent       year         lifeExp     
    ##  Australia  :12   Oceania:24   Min.   :1952   Min.   :69.12  
    ##  New Zealand:12                1st Qu.:1966   1st Qu.:71.20  
    ##                                Median :1980   Median :73.67  
    ##                                Mean   :1980   Mean   :74.33  
    ##                                3rd Qu.:1993   3rd Qu.:77.55  
    ##                                Max.   :2007   Max.   :81.23  
    ##       pop             gdpPercap    
    ##  Min.   : 1994794   Min.   :10040  
    ##  1st Qu.: 3199212   1st Qu.:14142  
    ##  Median : 6403492   Median :17983  
    ##  Mean   : 8874672   Mean   :18622  
    ##  3rd Qu.:14351625   3rd Qu.:22214  
    ##  Max.   :20434176   Max.   :34435

``` r
nlevels(just_oceania$continent)
```

    ## [1] 1

``` r
nlevels(just_oceania$country)
```

    ## [1] 2

``` r
#After dropping Oceania
without_oceania <- gapminder %>% filter(continent != "Oceania") %>% droplevels()
summary(without_oceania)
```

    ##         country        continent        year         lifeExp     
    ##  Afghanistan:  12   Africa  :624   Min.   :1952   Min.   :23.60  
    ##  Albania    :  12   Americas:300   1st Qu.:1966   1st Qu.:48.08  
    ##  Algeria    :  12   Asia    :396   Median :1980   Median :60.34  
    ##  Angola     :  12   Europe  :360   Mean   :1980   Mean   :59.26  
    ##  Argentina  :  12                  3rd Qu.:1993   3rd Qu.:70.75  
    ##  Austria    :  12                  Max.   :2007   Max.   :82.60  
    ##  (Other)    :1608                                                
    ##       pop              gdpPercap       
    ##  Min.   :6.001e+04   Min.   :   241.2  
    ##  1st Qu.:2.780e+06   1st Qu.:  1189.1  
    ##  Median :7.024e+06   Median :  3449.5  
    ##  Mean   :2.990e+07   Mean   :  7052.4  
    ##  3rd Qu.:1.987e+07   3rd Qu.:  8943.2  
    ##  Max.   :1.319e+09   Max.   :113523.1  
    ## 

``` r
nrow(without_oceania)
```

    ## [1] 1680

``` r
nlevels(without_oceania$continent)
```

    ## [1] 4

``` r
nlevels(without_oceania$country)
```

    ## [1] 140

Tidy data and joins
================
Gokul Raj Suresh Kumar
2016-10-09

Tidying data and performing joins
=================================

#### Loading the tidyverse and gapminder packages

``` r
library( tidyverse )
library( gapminder )
```

General data reshaping and relationship to aggregation
------------------------------------------------------

### Activity \#2

#### A tibble with one row per year and columns for life expectancy

``` r
my_gap <- gapminder %>% 
  select( year , country , lifeExp ) %>% 
  filter( country %in% c( "India" , "Canada" , "United States" , "China" , "Japan" ))

le_by_year <- my_gap %>% 
  spread ( key = "country" , value = "lifeExp" )

knitr::kable(le_by_year)
```

|  year|  Canada|     China|   India|   Japan|  United States|
|-----:|-------:|---------:|-------:|-------:|--------------:|
|  1952|  68.750|  44.00000|  37.373|  63.030|         68.440|
|  1957|  69.960|  50.54896|  40.249|  65.500|         69.490|
|  1962|  71.300|  44.50136|  43.605|  68.730|         70.210|
|  1967|  72.130|  58.38112|  47.193|  71.430|         70.760|
|  1972|  72.880|  63.11888|  50.651|  73.420|         71.340|
|  1977|  74.210|  63.96736|  54.208|  75.380|         73.380|
|  1982|  75.760|  65.52500|  56.596|  77.110|         74.650|
|  1987|  76.860|  67.27400|  58.553|  78.670|         75.020|
|  1992|  77.950|  68.69000|  60.223|  79.360|         76.090|
|  1997|  78.610|  70.42600|  61.765|  80.690|         76.810|
|  2002|  79.770|  72.02800|  62.879|  82.000|         77.310|
|  2007|  80.653|  72.96100|  64.698|  82.603|         78.242|

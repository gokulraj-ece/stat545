# loading the necessary packages
library(tidyverse)
library(ggplot2)
library(Cairo)

# importing the gapminder data
gapminder_tbl <- read_tsv("gapminder.tsv")

# dropping variables 'population' and 'gdp per capita' as they're not relevant for
# this analyses. Oceania has also been dropped to make life easier 
gap_data <- gapminder_tbl %>% 
  select( - pop , - gdpPercap ) %>% 
  filter( continent != "Oceania" )

# plotting life expectancy vs year for all the continents and saving to disk
CairoPNG( filename =  "le_vs_year.png" , width = 580 , height = 440 )
ggplot( gap_data , aes( x = year , y = lifeExp ) ) + 
  geom_point( aes( color = continent ) )
dev.off( )

# facetting the above plot by continent, applying linear regression and saving to disk
CairoPNG( filename =  "le_vs_year_lin_fit.png" , width = 580 , height = 440 )
ggplot( gap_data , aes( x = year , y = lifeExp ) ) + 
  facet_wrap( ~ continent ) +
  geom_point( ) + geom_smooth( method = "lm" , se = FALSE )
dev.off( )

# grouping the data based on continent and life expectancy
gap_reord_conti_le <- gap_data %>% 
  group_by( continent , lifeExp )

## @knitr gap_sort_conti_le
# sorting the grouped data on increasing order of life expectancy
gap_sort_conti_le <- gap_reord_conti_le %>% 
  arrange( continent , lifeExp )

# writing the data to file for future use
write_tsv( gap_sort_conti_le , "gap_sort_conti_le.tsv" )

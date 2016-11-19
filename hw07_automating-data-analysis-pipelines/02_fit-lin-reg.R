# loading the necessary packages
library(tidyverse)
library(broom)

# importing the rearranged data
gap_sort_conti_le <- read_tsv("gap_sort_conti_le.tsv")

# applying linear regression to the data
gap_lin_reg_broom <- gap_sort_conti_le %>% 
  group_by( continent , country ) %>% 
  do( fit = lm( lifeExp ~ I( year - 1952 ) , . ) )

# using 'broom::tidy()' to extract information from the linear model
gap_lin_reg_ests <- gap_lin_reg_broom %>% 
  tidy( fit ) %>% 
  select( -std.error , -statistic , -p.value ) %>% 
  spread( key = "term" , value = "estimate" ) %>% 
  rename( Intercept = `(Intercept)` , Slope = `I(year - 1952)` )

# function to select the 3 'best' and 'worst' countries based on life expectancy 
filter_sort_best_worst <- function( cont ){
  result <-  gap_lin_reg_ests %>% 
    filter( continent == cont ) %>% 
    group_by( continent ) %>% 
    filter( min_rank( desc( Slope ) ) < 4 | min_rank( Slope ) < 4 )
  return( result )
}

# determining the 3 best and worst countries in Asia
asia_best_worst_ests <- filter_sort_best_worst( "Asia" )

# performing a semi join with the sorted data to get the information of the chosen countries
asia_best_worst_countries <- semi_join( gap_sort_conti_le , asia_best_worst_ests )

# writing the data to file for future use
write_tsv( asia_best_worst_countries , "asia_best_worst_countries.tsv" )

# determining the 3 best and worst countries in Americas
americas_best_worst_ests <- filter_sort_best_worst( "Americas" )

# performing a semi join with the sorted data to get the information of the chosen countries
americas_best_worst_countries <- semi_join( gap_sort_conti_le , americas_best_worst_ests )

# writing the data to file for future use
write_tsv( americas_best_worst_countries , "americas_best_worst_countries.tsv" )

# determining the 3 best and worst countries in Africa
africa_best_worst_ests <- filter_sort_best_worst( "Africa" )

# performing a semi join with the sorted data to get the information of the chosen countries
africa_best_worst_countries <- semi_join( gap_sort_conti_le , africa_best_worst_ests )

# writing the data to file for future use
write_tsv( africa_best_worst_countries , "africa_best_worst_countries.tsv" )

# determining the 3 best and worst countries in Europe
europe_best_worst_ests <- filter_sort_best_worst("Europe")

# performing a semi join with the sorted data to get the information of the chosen countries
europe_best_worst_countries <- semi_join( gap_sort_conti_le , europe_best_worst_ests )

# writing the data to file for future use
write_tsv( europe_best_worst_countries , "europe_best_worst_countries.tsv" )

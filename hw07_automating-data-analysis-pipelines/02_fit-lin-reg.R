library(tidyverse)
library(forcats)
library(broom)


gap_sort_conti_le <- read_tsv("gap_sort_conti_le.tsv")

gap_lin_reg_broom <- gap_sort_conti_le %>% 
  group_by( continent , country ) %>% 
  do( fit = lm( lifeExp ~ I( year - 1952 ) , . ) )

gap_lin_reg_ests <- gap_lin_reg_broom %>% 
  tidy( fit ) %>% 
  select( -std.error , -statistic , -p.value ) %>% 
  spread( key = "term" , value = "estimate" ) %>% 
  rename( Intercept = `(Intercept)` , Slope = `I(year - 1952)` )

filter_sort_best_worst <- function( cont ){
  result <-  gap_lin_reg_ests %>% 
    filter( continent == cont ) %>% 
    group_by( continent ) %>% 
    filter( min_rank( desc( Slope ) ) < 4 | min_rank( Slope ) < 4 )
  return( result )
}

asia_best_worst_ests <- filter_sort_best_worst( "Asia" )

asia_best_worst_countries <- semi_join( gap_sort_conti_le , asia_best_worst_ests )

write_tsv( asia_best_worst_countries , "asia_best_worst_countries.tsv" )

americas_best_worst_ests <- filter_sort_best_worst( "Americas" )

americas_best_worst_countries <- semi_join( gap_sort_conti_le , americas_best_worst_ests )

write_tsv( americas_best_worst_countries , "americas_best_worst_countries.tsv" )

africa_best_worst_ests <- filter_sort_best_worst( "Africa" )

africa_best_worst_countries <- semi_join( gap_sort_conti_le , africa_best_worst_ests )

write_tsv( africa_best_worst_countries , "africa_best_worst_countries.tsv" )

europe_best_worst_ests <- filter_sort_best_worst("Europe")

europe_best_worst_countries <- semi_join( gap_sort_conti_le , europe_best_worst_ests )

write_tsv( europe_best_worst_countries , "europe_best_worst_countries.tsv" )

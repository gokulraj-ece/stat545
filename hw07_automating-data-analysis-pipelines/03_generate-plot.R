# loading the necessary packages
library(tidyverse)
library(ggplot2)
library(Cairo)

# importing the filtered data for Asia
asia_best_worst_countries <- read_tsv( "asia_best_worst_countries.tsv" )

# importing the filtered data for Americas
americas_best_worst_countries <- read_tsv( "americas_best_worst_countries.tsv" )

# importing the filtered data for Africa
africa_best_worst_countries <- read_tsv( "africa_best_worst_countries.tsv" )

# importing the filtered data for Europe
europe_best_worst_countries <- read_tsv( "europe_best_worst_countries.tsv" )

# function to plot life expectancy vs year, facet by continent and overlay the fitted line
plot_lm_facet <- function( country_under_test ){
  result_plot <- ggplot( country_under_test , aes( x = year , y = lifeExp ) ) + 
    geom_point( ) +
    facet_wrap( ~ country ) +
    geom_smooth( method = "lm" , se = FALSE )
  return( result_plot )
}

# plotting life expectancy vs year filtered countries of Asia and saving to disk
CairoPNG( filename =  "asia_best_worst_le.png" , width = 580 , height = 440 )
plot_lm_facet( asia_best_worst_countries )
dev.off( )

# plotting life expectancy vs year filtered countries of Americas and saving to disk
CairoPNG( filename =  "americas_best_worst_le.png" , width = 580 , height = 440 )
plot_lm_facet( americas_best_worst_countries )
dev.off( )

# plotting life expectancy vs year filtered countries of Africa and saving to disk
CairoPNG( filename =  "africa_best_worst_le.png" , width = 580 , height = 440 )
plot_lm_facet( africa_best_worst_countries )
dev.off( )

# plotting life expectancy vs year filtered countries of Europe and saving to disk
CairoPNG( filename =  "europe_best_worst_le.png" , width = 580 , height = 440 )
plot_lm_facet( europe_best_worst_countries )
dev.off( )

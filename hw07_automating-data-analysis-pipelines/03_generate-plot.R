library(tidyverse)
library(ggplot2)
library(Cairo)

asia_best_worst_countries <- read_tsv( "asia_best_worst_countries.tsv" )

americas_best_worst_countries <- read_tsv( "americas_best_worst_countries.tsv" )

africa_best_worst_countries <- read_tsv( "africa_best_worst_countries.tsv" )

europe_best_worst_countries <- read_tsv( "europe_best_worst_countries.tsv" )

plot_lm_facet <- function( country_under_test ){
  result_plot <- ggplot( country_under_test , aes( x = year , y = lifeExp ) ) + 
    geom_point( ) +
    facet_wrap( ~ country ) +
    geom_smooth( method = "lm" , se = FALSE )
  return( result_plot )
}

CairoPNG( filename =  "asia_best_worst_le.png" , width = 580 , height = 440 )
plot_lm_facet( asia_best_worst_countries )
dev.off( )

CairoPNG( filename =  "americas_best_worst_le.png" , width = 580 , height = 440 )
plot_lm_facet( americas_best_worst_countries )
dev.off( )

CairoPNG( filename =  "africa_best_worst_le.png" , width = 580 , height = 440 )
plot_lm_facet( africa_best_worst_countries )
dev.off( )

CairoPNG( filename =  "europe_best_worst_le.png" , width = 580 , height = 440 )
plot_lm_facet( europe_best_worst_countries )
dev.off( )

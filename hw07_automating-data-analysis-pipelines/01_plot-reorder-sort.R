library(tidyverse)
library(ggplot2)
library(Cairo)

gapminder_tbl <- read_tsv("gapminder.tsv")

gap_data <- gapminder_tbl %>% 
  select( - pop , - gdpPercap ) %>% 
  filter( continent != "Oceania" )

CairoPNG( filename =  "le_vs_year.png" , width = 580 , height = 440 )
ggplot( gap_data , aes( x = year , y = lifeExp ) ) + 
  geom_point( aes( color = continent ) )
dev.off( )

CairoPNG( filename =  "le_vs_year_lin_fit.png" , width = 580 , height = 440 )
ggplot( gap_data , aes( x = year , y = lifeExp ) ) + 
  facet_wrap( ~ continent ) +
  geom_point( ) + geom_smooth( method = "lm" , se = FALSE )
dev.off( )

gap_reord_conti_le <- gap_data %>% 
  group_by( continent , lifeExp )

write_tsv( gap_reord_conti_le , "gap_reord_conti_le.tsv" )

gap_sort_conti_le <- gap_reord_conti_le %>% 
  arrange( continent , lifeExp )

write_tsv( gap_sort_conti_le , "gap_sort_conti_le.tsv" )

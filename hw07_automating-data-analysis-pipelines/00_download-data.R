# loading the necessary packages
library(downloader)

# fetching the gapminder data from the URL and saving it as a .tsv file
download( url = "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/gapminder.tsv" , 
          destfile = "gapminder.tsv")

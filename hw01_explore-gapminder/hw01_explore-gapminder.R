p <- ggplot(subset(gapminder, continent != "Oceania"),
            aes(x = gdpPercap, y = lifeExp)) # just initializes
p <- p + scale_x_log10() # log the x axis the right way
p + geom_point() # scatterplot
p + geom_point(aes(color = continent)) # map continent to color
p + geom_point(alpha = (1/3), size = 3) + geom_smooth( lwd = 3, se = FALSE)
p + geom_point(alpha = (1/3), size = 3) + facet_wrap(~ continent) + 
geom_smooth( lwd = 1.5, se = FALSE)
-----------------------------
subset(gapminder, subset = country == "India", select = c(country, year, lifeExp))
-----------------------------
p <- ggplot(subset(gapminder, country == "India"),
           aes(x = year, y = lifeExp)) 
p + geom_point() + geom_smooth( lwd = 1,se = FALSE, method = "lm")
-----------------------------
(minYear <- min(gapminder$year))
myFit <- lm(lifeExp ~ I(year - minYear), gapminder, subset = country == "Colombia")
summary(myFit)
plot(myFit)
-----------------------------
lm(lifeExp ~ year, gapminder, subset = country == "India")
plot(lifeExp ~ year, gapminder, subset = country == "India")
-----------------------------
with(subset(gapminder, subset = country == "India"),
       cor(lifeExp, gdpPercap))

## HW08 - Building a Shiny app

####The [`link`](https://gokulraj-ece.shinyapps.io/bcls/) to the app hosted on the `shinyapps.io` server

###Improvements made to the app

- Sorting the results table by price

- Adding images of the BC liquor store to the UI (added a banner and an image on the sidebar)

- Using `DT` package to convert the results into an interactive table

- Fixing the issue where an empty plot and table are generated when the filtered result is 0

- Placing the plot and the table in separate tabs

- Adding `CSS` to position elements in a better way (minimal usage)

- Experimenting with `shinythemes` package

- Showing the number of results found whenever the filters change

- Allowing the user to download the results as a `.csv` file

- When only wines are selected, showing a new input that allows the user to filter by sweetness level

- Adding an input for the "subtype" that lets the user to filter for only a specific subtype of products

- Providing a way for the user to show results from all countries (using the checkbox approach)

###Issues faced

- Tried to use `ggvis` to generate the plot and the plot was generated successfully, but an error message was displayed beneath the plot stating that R `cannot coerce type 'closure' to vector of type 'character'`

- Tried to allow the user to search for multiple alcohol types simultaneously using the `selectInput()` approach with argument `multiple = TRUE` but this created a lot of complexity especially with other filters like `Subtype` and `Sweetness` already in effect, and hence chose to use `radioButtons()` instead

- A minor glitch happens when the app loads, where some of the fields report an error `incorrect length(0)` and disappears in a fraction. I did refer to the section `11.3 Errors showing up and quickly disappearing` of the [Building Shiny Apps](http://stat545.com/shiny01_activity.html) material by Dean Attali but I guess I didn't implement the fix correctly. Any assistance in resolving this is highly appreciated!

###References

- Dean Attali's [Building Shiny Apps](http://stat545.com/shiny01_activity.html) was setting the stage and his [BC Liquor Store Prices](https://daattali.com/shiny/bcl/) Shiny App was a great reference

- RStudio's [Shiny Tutorial](http://shiny.rstudio.com/tutorial/) was of massive help

- RStudio's [Shiny Themes](http://rstudio.github.io/shinythemes/)

- And [Stack Overflow](http://stackoverflow.com/), what would I accomplish without you!
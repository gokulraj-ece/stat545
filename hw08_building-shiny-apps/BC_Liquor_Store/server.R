library(tidyverse)

# reading the data from the csv file
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)


function(input, output, session){
  
  # a reactive element that returns a reactive variable filtered by Price, Type and/or Country
 	filtered <- reactive({
 	  if (!input$selectCountry) {
 	    return(
 	      bcl %>% 
 	        filter(Price >= input$priceInput[1], 
 	               Price <= input$priceInput[2], 
 	               Type == input$typeInput)
 	    )
 	  }
 	  else {
 	    return(
 	      bcl %>% 
 	        filter(Price >= input$priceInput[1], 
 	               Price <= input$priceInput[2],
 	               Type == input$typeInput,
 	               Country == input$countryInput)
 	      )
 	  }
 	})
 	
 	# a reactive element that uses the reactive variable 'filtered' and filters it by category
 	# "WINE" and if so, returns a reactive value that is filtered by sweetness level
 	filtered_data <- reactive({
 	  if(input$typeInput == "WINE") {
 	    return(
 	      filtered() %>%
 	        filter(Sweetness == input$sweetnessLevel)
 	      )
 	  }
 	  else {
 	    return(
 	      filtered()
 	      )
 	  }
 	})
 	
 	# a reactive element that uses the reactive variable 'filtered_data' and returns 
 	# the names of the 'Subtypes' for usage in the 'subtypeInput' drop down box
 	subtype_data <- reactive({
 	  if(nrow(filtered_data()) == 0) {
 	    return(NULL)
 	  } 
 	  else {
 	    return(
 	      filtered_data() %>%
 	        select(Subtype) %>%
 	        unique()
 	      )
 	  }
 	})
 	
 	# the main reactive element that will be used for generating the table and
 	# the main plot. It filters the product by 'Subtype' if applicable
 	filtered_subtype_data <- reactive({
 	  if (is.null(input$countryInput)) {
 	    return(NULL)
 	  }
 	  if(nrow(filtered_data()) == 0) {
 	    return(NULL)
 	  }
 	  if(input$sortByPrice) {
 	    return(
 	      filtered_data() %>%
 	        filter(Subtype == input$subtypeInput) %>%
 	        arrange(Price)
 	      )
 	  }
 	  else {
 	    return(
 	      filtered_data() %>%
 	        filter(Subtype == input$subtypeInput)
 	      )
 	  }
 	})
 	
 	# generates the main plot to be plotted in the placeholder provided by the ui.R file
	output$mainplot <- renderPlot({
	  if (is.null(filtered_subtype_data())) {
	    return(NULL)
	  }
	  else {
	    ggplot(filtered_subtype_data(), aes(Alcohol_Content)) +
	      geom_histogram(color = "black", fill = "steelblue3")
	  }
	})
	
	# generates the table to be populated in the placeholder provided by the ui.R file
	output$results <- DT::renderDataTable({
	  filtered_subtype_data()
	})
	
	# generates the fields for the country names in the drop down box when checkbox is selected
	output$countryOutput <- renderUI({
	 	selectInput("countryInput", "Country",
	 	            choices = sort(unique(bcl$Country)),
	 	            selected = "CANADA")
	})
	
	# the handler to download the generated data in CSV format and to write it to file
	output$downloadData <- downloadHandler(
		filename = function() { 
		  paste('bcl_data-', Sys.Date(), ".csv", sep = "")
		  },
		content = function(file) { 
		  write.csv(filtered_subtype_data(), file)
		  }
	)
	
	# calculates the count of the records generated after filtering and displays to the user
	output$countResults <- renderText({
	  if (is.null(filtered_subtype_data())) {
	    return(
	      paste("We were unable to find any options for you")
	      )
	  }
	  else {
	    paste("We found ", nrow(filtered_subtype_data()), " options for you")
	  }
	})
	
	# generates the fields for the sweetness level if the type of the beverage is 'WINE'
	output$sweetnessLevelOutput <- renderUI({
	  conditionalPanel(
	    condition = "input.typeInput == 'WINE'",
	    selectInput("sweetnessLevel", "Sweetness level", 
	                sort(unique(bcl$Sweetness))
	                )
	  )
	})
	
	# generates the fields for the subtypes based on the type of the product
	output$subTypeOutput <- renderUI({
	  if (is.null(subtype_data())) {
	    return(NULL)
	  }
	  selectInput("subtypeInput", "Sub-type", subtype_data())
	})
	
}
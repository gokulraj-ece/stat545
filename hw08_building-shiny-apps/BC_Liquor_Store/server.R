library(tidyverse)
library(ggvis)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

function(input, output, session){

 	filtered <- reactive({
 	  if (is.null(input$countryInput)) {
 	    return(NULL)
 	  }
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
 	
 	subtype_data <- reactive({
 	  if(nrow(filtered_data()) == 0) {
 	    return(NULL)
 	  } else {
 	    return(
 	      filtered_data() %>%
 	        select(Subtype) %>%
 	        unique()
 	      )
 	  }
 	})
 	
 	filtered_subtype_data <- reactive({
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
 	
	output$mainplot_ui <- renderPlot({
	  if (is.null(filtered_subtype_data())) {
	    return(NULL)
	  }
	  ggplot(filtered_subtype_data(), aes(Alcohol_Content)) +
		 	geom_histogram()
	})
	
	output$results <- DT::renderDataTable({
	  filtered_subtype_data()
	})
	
	output$countryOutput <- renderUI({
	 	selectInput("countryInput", "Country",
	 	            choices = sort(unique(bcl$Country)),
	 	            selected = "CANADA")
	})
	
	output$downloadData <- downloadHandler(
		filename = function() { 
		  paste('bcl_data-', Sys.Date(), ".csv", sep = "")
		  },
		content = function(file) { 
		  write.csv(filtered_subtype_data(), file)
		  }
	)
	
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
	
	output$sweetnessLevelOutput <- renderUI({
	  conditionalPanel(
	    condition = "input.typeInput == 'WINE'",
	    selectInput("sweetnessLevel", "Sweetness level", 
	                sort(unique(bcl$Sweetness))
	                )
	  )
	})
	
	output$subTypeOutput <- renderUI({
	  selectInput("subtypeInput", "Sub-type", subtype_data())
	})
}
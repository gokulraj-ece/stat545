library(tidyverse)
library(ggvis)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

function(input, output, session){

 	filtered <- reactive({
	  
	  if (is.null(input$countryInput)) {
	    return(NULL)
	  } 
	  
	  bcl %>% 
	    filter(Price >= input$priceInput[1],
	           Price <= input$priceInput[2],
	           Type %in% input$typeInput,
	           Country == input$countryInput)
	  })
 	
 	filtered_data <- reactive({
 	  
 	  if (input$sortByPrice) {
 	    filtered() %>% arrange(Price)
 	    }
 	  else if (input$typeInput == "WINE") {
 	    filtered() %>% filter(Sweetness == input$sweetnessLevel)
 	    }
 	  else {
 	    filtered()
 	  }
 	  
 	})

	output$mainplot_ui <- renderPlot({
	  ggplot(filtered_data(), aes(Alcohol_Content)) +
		 	geom_histogram()
	  # filtered_data() %>% ggvis(~Alcohol_Content) %>% layer_histograms() %>% bind_shiny("mainplot", "mainplot_ui")
	})
	
	output$results <- DT::renderDataTable({
	  filtered_data()
	})
	
	output$countryOutput <- renderUI({
	 	selectInput("countryInput", "Country",
	 				choices = sort(unique(bcl$Country)),
	 				selected = "CANADA")
	})
	
	output$typeOutput <- renderUI({
		selectInput("typeInput", "Product Type",
					sort(unique(bcl$Type)),
					selected = "BEER", multiple = TRUE)
	})
	
	output$downloadData <- downloadHandler(
		filename = function(){ 
		  paste('bcl_data-', Sys.Date(), ".csv", sep = "")
		  },
		content = function(file){ 
		  write.csv(filtered_data(), file) 
		  }
	)
	
	output$countResults <- renderText({
	  paste("We found ", nrow(filtered_data()), " options for you")
	})
	
	output$sweetnessLevelOutput <- renderUI({
	  conditionalPanel(
	    condition = "input.typeInput == 'WINE'",
	    selectInput("sweetnessLevel", "Select sweetness level", sort(unique(bcl$Sweetness)))
	  )
	})
	
	# output$selectCountryOutput <- renderUI({
	#   checkboxInput("selectCountry", "Select a country", FALSE)
	# })
	
	# output$countryOutput <- renderUI({
	#   conditionalPanel(
	#     condition = input$selectCountry,
	#     selectInput("countryInput", "Country", choices = sort(unique(bcl$Country)), selected = "CANADA")
	#   )
	# })
}
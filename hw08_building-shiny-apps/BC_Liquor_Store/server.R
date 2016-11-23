library(ggplot2)
library(dplyr)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

function(input, output){
	filtered <- reactive({
		
		if(is.null(input$countryInput)){
			return(NULL)
		}
		
		bcl %>% 
			filter(
				Price >= input$priceInput[1],
				Price <= input$priceInput[2],
				Type == input$typeInput,
				Country == input$countryInput
			)
		})
	
	output$mainplot <- renderPlot({
		if(is.null(filtered())){
			return(NULL)
		}
		ggplot(filtered(), aes(Alcohol_Content)) +
			geom_histogram() 
	})
	
	output$results <- DT::renderDataTable({
		filtered()
	})
	
	output$countryOutput <- renderUI({
		selectInput("countryInput", "Country", 
					choices = sort(unique(bcl$Country)),
					selected = "CANADA")
	})
	output$typeOutput <- renderUI({
		selectInput("typeInput", "Product Type",
					sort(unique(bcl$Type)),
					selected = "WINE", multiple = TRUE)
	})
	output$downloadData <- downloadHandler(
		filename = function(){ 
		  paste('Liq_data-', Sys.Date(), ".csv", sep = "") 
		  },
		content = function(file){ 
		  write.csv(filtered(), file) 
		  }
	)
	output$countResults <- renderText({
	  paste("We found ", nrow(filtered()), " options for you")
	})
}
library(shinythemes)

fluidPage(
  # using a theme from the 'shinythemes' package
  theme = shinytheme("spacelab"),
  # including stylesheets placed in the www folder
  includeCSS("styles.css"),
  # adding a custom banner to the webpage
  img(src = "banner.png"),
  # adding a panel to display the title
  titlePanel("Beverage Info", windowTitle = "BCLS prices"),
  # segregating the UI into two panels for better access to the handles
	sidebarLayout(
	  # defining components of the sidebar panel
		sidebarPanel(
		  # defining a slider input
			sliderInput("priceInput", "Price", min = 0, max = 100, value = c(25, 40), pre = "$"),
			# defining radio buttons to choose product type
			radioButtons("typeInput", "Type",
			             choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
			             selected = "WINE"),
			# placeholder to display the sweetness level selector drop down box
			uiOutput("sweetnessLevelOutput"),
			# placeholder to display the product sub-type selector drop down box
			uiOutput("subTypeOutput"),
			# checkbox to display data sorted by price in ascending order
			checkboxInput("sortByPrice", "Sort by Price", FALSE),
			# checkbox to reveal the 'filter by country' drop down box
			checkboxInput("selectCountry", "Filter by Country", FALSE),
			# conditional panel that reveals the country selection drop down box
			conditionalPanel(
			  condition = "input.selectCountry",
			  uiOutput("countryOutput")
			),
			br(), br(),
			# adding a custom image to the sidebar panel
			img(src = "ghs.png")
		),
		#defining the components of the main panel
		mainPanel(
		  # Placeholder to display the total number of entries populated
		  textOutput("countResults"),
		  # Button element to download the data in CSV format
		  downloadButton("downloadData", "Download result"),
			br(),br(),
			# Tab panel to display the plot and the table in seperate tabs
			tabsetPanel(
			  # tab containing the placeholder to display the plot
				tabPanel("Plot", plotOutput("mainplot")),
				# tab containing the placeholder to display the table
				tabPanel("Table", DT::dataTableOutput("results"))
			)
		)
	)
)
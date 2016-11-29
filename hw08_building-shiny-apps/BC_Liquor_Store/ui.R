library(shinythemes)

fluidPage(
  theme = shinytheme("sandstone"),
  includeCSS("styles.css"),
  img(src = "banner.png"),
  titlePanel("Beverage Info", windowTitle = "BCLS prices"),
	sidebarLayout(
		sidebarPanel(
			sliderInput("priceInput", "Price", min = 0, max = 100, value = c(25, 40), pre = "$"),
			radioButtons("typeInput", "Type",
			             choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
			             selected = "WINE"),
			uiOutput("sweetnessLevelOutput"),
			uiOutput("subTypeOutput"),
			checkboxInput("sortByPrice", "Sort by Price", FALSE),
			checkboxInput("selectCountry", "Filter by Country", FALSE),
			conditionalPanel(
			  condition = "input.selectCountry",
			  uiOutput("countryOutput")
			),
			br(), br(),
			img(src = "ghs.png")
		),
		mainPanel(
		  textOutput("countResults"),
		  downloadButton("downloadData", "Download result"),
			br(),br(),
			tabsetPanel(
				tabPanel("Plot", plotOutput("mainplot_ui")),
				tabPanel("Table", DT::dataTableOutput("results"))
			)
		)
	)
)


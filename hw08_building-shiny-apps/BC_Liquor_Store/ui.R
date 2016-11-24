library(shinythemes)

fluidPage(
  theme = shinytheme("sandstone"),
  includeCSS("styles.css"),
  img(src = "banner.png"),
  titlePanel("Liquor prices", windowTitle = "BCLS prices"),
	sidebarLayout(
		sidebarPanel(
			sliderInput("priceInput", "Price", min = 0, max = 100, value = c(25, 40), pre = "$"),
			uiOutput("typeOutput"),
			uiOutput("sweetnessLevelOutput"),
			checkboxInput("sortByPrice", "Sort by Price", FALSE),
			# uiOutput("selectCountryOutput"),
			uiOutput("countryOutput"),
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


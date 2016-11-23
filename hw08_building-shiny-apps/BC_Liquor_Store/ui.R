fluidPage(
  includeCSS("styles.css"),
  img(src = "banner.png"),
  titlePanel("Liquor prices", windowTitle = "BCLS prices"),
	sidebarLayout(
		sidebarPanel(
			sliderInput("priceInput", "Price", min = 0, max = 100, value = c(25, 40), pre = "$"),
			uiOutput("typeOutput"),
			uiOutput("countryOutput"),
			textOutput("countResults")
		),
		mainPanel(
			downloadButton("downloadData", "Download"),
			br(),br(),
			tabsetPanel(
				tabPanel("Plot", plotOutput("mainplot")),
				tabPanel("Table", DT::dataTableOutput("results"))
			)
		)
	)
)


fluidPage(
  includeCSS("styles.css"),
  img(src = "banner.png"),
  titlePanel("Liquor prices", windowTitle = "BCLS prices"),
	sidebarLayout(
		sidebarPanel(
			sliderInput("priceInput", "Price", min = 0, max = 100, value = c(25, 40), pre = "$"),
			uiOutput("typeOutput"),
			uiOutput("countryOutput")
		),
		mainPanel(
			#downloadButton("downloadData", "Download"),
			tabsetPanel(
				tabPanel("Plot", plotOutput("mainplot")),
				tabPanel("Table", DT::dataTableOutput("results"))
			)
		)
	)
)


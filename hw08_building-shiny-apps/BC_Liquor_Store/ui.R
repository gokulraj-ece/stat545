fluidPage(
	titlePanel("BCLS prices", windowTitle = "BCLS prices"),
	sidebarLayout(
		sidebarPanel(
			sliderInput("priceInput", "Price", min = 0, max = 100, value = c(25, 40), pre = "$"),
			uiOutput("typeOutput"),
			uiOutput("countryOutput")
		),
		mainPanel(
			plotOutput("mainplot"),
			br(), br(),
			tableOutput("results")
		)
	)
)


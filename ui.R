library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("ToothGrowth"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("mode", "Mode of Delivery:",
                   c("Orange Juice" = "OJ",
                     "Ascorbic Acid" = "VC"),
                   selected = c("OJ","VC")),
      br(),
      
      sliderInput("dose", 
                  "Dose:", 
                  min = 0.5, 
                  max = 2.0,
                  step = 0.5,
                  value = c(0.5,2)),
      br(),
      
      radioButtons("xAxis", "X - Axis", c("Mode of delivery"="supp", 
                                          "Dose"="dose"), selected="dose"),
      br(),
      h4("Usage Instructions"),
      p("Use this tool to visualize the effect of the",
        span(" dose ", style = "color:blue"), "and the ",
        span("mode of delivery", style = "color:blue"), " of ",
        span("vitamin C", style = "color:blue"), " on the lenght of odontoblasts ",
        span("(teeth)", style = "color:blue"), " of 10 guniea pigs."),
      p("There are three dose levels: 0.5, 1 and 2. Use the slider to select one or
      more of these levels."),
      p("Select the predictor of tooth length using the radio buttons for X-Axis.
        The resulting plot will show the effect of the predictor on tooth length."),
      p("The ",
        span("Summary", style = "color:blue"), " of the data subset and a ",
        span("Table", style = "color:blue"),  " view of the same are 
        available in the respective tabs in the main panel")
    ),
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot", plotOutput("plot")), 
                  tabPanel("Summary", verbatimTextOutput("summary")), 
                  tabPanel("Table", tableOutput("table"))
      )
    )
  )
))
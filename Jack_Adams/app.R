library(shiny)
library(dplyr)
library(ggplot2)
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))

# UI
ui <- fluidPage(
    sidebarLayout(
        
        # Input(s)
        sidebarPanel(
            
            # Select variable for y-axis
            selectInput(inputId = "y",
                        label = "Y-axis:",
                        choices = c("W","L", "T"),
                        selected = "W"),
            
            # Select variable for x-axis
            selectInput(inputId = "x",
                        label = "X-axis:",
                        choices = c("tmID"),
                        selected = "tmID")
            
        ),
        
        # Output(s)
        mainPanel(
            plotOutput(outputId = "scatterplot"),
            htmlOutput(outputId = "avgs"),
            verbatimTextOutput(outputId = "lmoutput") # regression output
        )
    )
)

# Server
server <- function(input, output) {
    

    # Create scatterplot
    output$scatterplot <- renderPlot({
        ggplot(data = teams_F, aes_string(x = input$x, y = input$y)) +
            geom_col(aes(fill=lgID)) +
            theme(axis.text.x = element_text(angle = 90, hjust = 1))
    })
    

}

# Create a Shiny app object
shinyApp(ui = ui, server = server)
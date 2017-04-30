#This is a UI that plots an aging curve against height and predicts future
#height based on current height

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Child Height Predictor"),
  
  tabsetPanel(type = "tabs",
              tabPanel("0 to 36 mos.",
                       sidebarLayout(
                           sidebarPanel(
                               radioButtons("sex1", "Gender:", 
                                            c("Male" = "Male", 
                                              "Female" = "Female"), 
                                            inline = TRUE),
                               fluidRow(
                                   column(8, textInput("height1", "Height:")),
                                   column(3, radioButtons("unit1", label = NULL,
                                                c("cm" = "cm",
                                                  "inches" = "inches")))
                               ),
                               fluidRow(
                                   column(3, HTML("<b>Age:</b>")),
                                   column(5, selectInput("age1", label = NULL,
                                                         choices = (0:72)/2,
                                                         selected = 0)),
                                   column(3, "months")
                               ),
                               submitButton("Submit")
                           ),
                           mainPanel(
                               plotOutput("infCurvePlot"),
                               h3("Predicted height at 36 months:"),
                               textOutput("infText")
                           )
                       )),
              tabPanel("2 to 20 years",
                       sidebarLayout(
                           sidebarPanel(
                               radioButtons("sex2", "Gender:", 
                                        c("Male" = "Male", 
                                          "Female" = "Female"), 
                                        inline = TRUE),
                               fluidRow(
                                   column(8, textInput("height2", "Height:")),
                                   column(3, radioButtons("unit2", label = NULL,
                                                      c("cm" = "cm",
                                                        "inches" = "inches")))
                               ),
                               HTML("<b>Age:</b>"),
                               fluidRow(
                                   column(4, selectInput("yrs2", label = NULL,
                                                         choices = 2:19,
                                                         selected = 0)),
                                   column(2, "yrs."),
                                   column(4, selectInput("mos2", label = NULL,
                                                         choices = (0:23)/2,
                                                         selected = 0)),
                                   column(2, "mos.")
                               ),
                               submitButton("Submit")
                                  
                           ),
                           mainPanel(
                               plotOutput("childCurvePlot"),
                               h3("Predicted height at 20 years:"),
                               textOutput("childText")
                           )
                       ))
      
  )
))

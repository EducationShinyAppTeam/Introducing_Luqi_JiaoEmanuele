# Load Packages ----
library(shiny)
library(shinydashboard)
library(shinyBS)
library(shinyWidgets)
library(boastUtils)
library(shinya11y)

# Load additional dependencies and setup functions
# source("global.R")

# Define UI for App ----
ui <- list(
  use_tota11y(),
  ## Create the app page ----
  dashboardPage(
    skin = "blue",
    ### Create the app header ----
    dashboardHeader(
      title = "Introducing Luqi", # You may use a shortened form of the title here
      titleWidth = 250,
      tags$li(class = "dropdown", actionLink("info", icon("info"))),
      tags$li(
        class = "dropdown",
        boastUtils::surveyLink(name = "Introducing_Luqi_JiaoEmanuele")
      ),
      tags$li(
        class = "dropdown",
        tags$a(href = 'https://shinyapps.science.psu.edu/',
               icon("house")
        )
      )
    ),
    ### Create the sidebar/left navigation menu ----
    dashboardSidebar(
      width = 250,
      sidebarMenu(
        id = "pages",
        menuItem("Overview", tabName = "overview", icon = icon("gauge-high")),
        menuItem("Explore", tabName = "explore", icon = icon("wpexplorer")),
        menuItem("Challenge", tabName = "challenge", icon = icon("gears")),
        menuItem("Game", tabName = "game", icon = icon("gamepad")),
        menuItem("References", tabName = "references", icon = icon("leanpub"))
      ),
      tags$div(
        class = "sidebar-logo",
        boastUtils::sidebarFooter()
      )
    ),
    ### Create the content ----
    dashboardBody(
      tabItems(
        #### Overview Page ----
        tabItem(
          tabName = "overview",
          withMathJax(),
          h1("Who am I?"), # This should be the full name.
          p("This is a sample Shiny application for BOAST. Which will help you 
            to get to know who I am."),
          br(),
          br(),
          h2("Instructions"),
          p("The following pages are for you to feel free to explore!"),
          tags$ol(
            tags$li("View the prerequiste using the Prerequistes Tab."),
            tags$li("Review any facts about me using the Explore Tab."),
            tags$li("Challenge yourself by playing a little game behind a story 
                    using the Challenge Tab."),
            tags$li("Playing a game to explore the important moments in my life 
                    using the Game Tab.")
          ),
          br(),
          ##### Go Button--location will depend on your goals
          div(
            style = "text-align: center;",
            bsButton(
              inputId = "goToExplore",
              label = "Explore!",
              size = "large",
              icon = icon("bolt"),
              style = "default"
            )
          ),
          ##### Create two lines of space
          br(),
          br(),
          h2("Acknowledgements"),
          p(
            "This version of the app was developed and coded by Neil J.
            Hatfield  and Robert P. Carey, III.",
            br(),
            "We would like to extend a special thanks to the Shiny Program
            Students.",
            br(),
            br(),
            "Cite this app as:",
            br(),
            citeApp(),
            br(),
            br(),
            div(class = "updated", "Last Update: 11/8/2022 by NJH.")
          )
        ),
        #### Note: you must have at least one of the following pages. You might
        #### have more than one type and/or more than one of the same type. This
        #### will be up to you and the goals for your app.
        #### Explore Page ----
        tabItem(
          tabName = "explore",
          withMathJax(),
          h2("Facts About Me"),
          p("Hi everyone! My name is Luqi Jiao Emanuele. Althrough the first 
            name looked like 'luqi', but It's actually pronounced as 'luchi' in 
            Chinese."),
          br(),
          box(
            title = strong("College Career"),
            status = "primary",
            collapsible = TRUE,
            collapsed = TRUE,
            width = '100%',
            "I will be a senior student in Penn State. Studying the following 
            majors:", 
            br(),
            br(),
            tags$ul(
              tags$li("B.S. in Economics"),
              tags$li("B.S. in Statistics wil Applied Option"), 
              tags$li("M.A.S. in Applied Statistics (starting in summer 2023)")
            ),
            br(),
            "Also, I will be a first year student studying a M.A.S. in Applied 
            Statistics in the Integrated Undergraduate/Graduate Program in the 
            summer. This allows me to graduate with my Bachelor's degree and my 
            Master's degree.", 
            br(),
            br(),
            tags$em("If you need any suggestion about course or major, please feel free 
            to reach out to me. I would love to help you out!")
          ),
          box(
            title = strong("Personal Life"),
            status = "primary",
            collapsible = TRUE,
            collapsed = TRUE,
            width = '100%',
            "In my spare time, I would like to do the following things:",
            br(),
            br(),
            tags$ul(
              tags$li("Hanging out with friends"),
              tags$li("Watching animations"), 
              tags$li("Cooking Chinese and Italian food"),
              tags$li("Playing video games"), 
              tags$li("Planting vegetables")
            ),
            br(),
            tags$em("If you have any good animations or video games suggestions, 
                    please let me know!")
          ),
          br(),
          p("Please use the bottom below to expore a challenge game."),
          br(),
          div(
            style = "text-align: center;",
            bsButton(
              inputId = "goToChallenge",
              label = "Challenge!",
              size = "large",
              icon = icon("forward"),
              style = "default"
            )
          )
        ),
        #### Challenge Page ----
        tabItem(
          tabName = "challenge",
          withMathJax(),
          h2("Our Family Chickens"),
          p("This page showed the story behind my family chickens."),
          br(),
          p("During the first year of the pandemic of COVID-19, my parents were 
            afraid of running out of eggs in the supermarkets since they limited 
            how many boxes of eggs you can buy. We decided to raise the chickens 
            on our own for the eggs."),
          p("From the Chick Chicken story, I will provide the picture of the 
            chickens again for you to play a little guessing game.  "),
          br(),
          tags$strong("Question: How many chickens do we have?"),
          br(),
          tags$em("(Hint: the amount of chickens are between 10 to 20.)"),
          br(),
          br(),
          tags$figure(
            class = "centerFigure",
          tags$img(
            src = "chick.jpg", 
            width = 300,
            alt = "Photo of the chickens")
          ),
          br(),
          br(),
          tags$em("Please note, this picture does not show the correct amount of 
                  the chickens."),
          br(),
          fluidRow(
            column(
              width = 5,
              offset = 0,
              wellPanel(
                selectInput(
                  inputId = "selectNumber",
                  label = "Select a number",
                  choices = c(10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, "Select one"),
                  selected = "Select one"
                ),
                bsButton(
                  inputId = "getResult",
                  label = "Submit",
                  size = "large",
                  style = "default"
                )
              )
            ),
            column(
              width = 7,
              offset = 1,
              plotOutput(outputId = "resultOutput")
            )
          ),
          br(),
          br(),
          div(
            style = "text-align: center;",
            bsButton(
              inputId = "goToGame",
              label = "Game!",
              size = "large",
              icon = icon("forward"),
              style = "default"
            )
          )
        ),
        #### Game Page ----
        tabItem(
          tabName = "game",
          withMathJax(),
          h2("Explore the Timeline"),
          p("On this type of page, you will explore different years to see some 
            of my important things happened in my life."), 
          br(),
          fluidRow(
            column(
              width = 12,
              sliderInput(
                inputId = "year",
                label = "Select a year",
                min = 2016,
                max = 2023,
                value = 50,
                step = 1
              ),
              uiOutput("timeLine")
            )
        ),
        br(),
          div(
            style = "text-align: center;",
            bsButton(
              inputId = "goToReferences",
              label = "References!",
              size = "large",
              icon = icon("book"),
              style = "default"
            )
          )
        ),
        #### References Page ----
        tabItem(
          tabName = "references",
          withMathJax(),
          tabItem(
            tabName = "References",
            h2("References"),
            p(     #shinyBS
              class = "hangingindent",
              "Bailey, E. (2015), shinyBS: Twitter bootstrap components for shiny,
            R package. Available from
            https://CRAN.R-project.org/package=shinyBS"
            ),
            p(     #Boast Utilities
              class = "hangingindent",
              "Carey, R. (2019), boastUtils: BOAST Utilities, R Package.
            Available from
            https://github.com/EducationShinyAppTeam/boastUtils"
            ),
            p(     #shinydashboard
              class = "hangingindent",
              "Chang, W. and Borges Ribeio, B. (2018), shinydashboard: Create
            dashboards with 'Shiny', R Package. Available from
            https://CRAN.R-project.org/package=shinydashboard"
            ),
            p(     #shiny
              class = "hangingindent",
              "Chang, W., Cheng, J., Allaire, J., Xie, Y., and McPherson, J.
            (2019), shiny: Web application framework for R, R Package.
            Available from https://CRAN.R-project.org/package=shiny"
            ),
            p(     #shinyWidgets
              class = "hangingindent",
              "Perrier, V., Meyer, F., Granjon, D., Fellows, I., and Davis, W.
            (2020), shinyWidgets: Custom Inputs Widgets for Shiny, R package.
            Available from
            https://cran.r-project.org/web/packages/shinyWidgets/index.html"
            ),
            p(      #shinya11y
              class = "hangingindent",
              "Henderson E, Scales J, Yates J (2023). _shinya11y: Accessibility (a11y) Tooling for
            'Shiny'_. R package version 0.0.0.9000."
            ),
          br(),
          br(),
          boastUtils::copyrightInfo()
     )
    )
   )
  )
 )
)

# Define server logic ----
server <- function(input, output, session) {
  
  ## Set up Info button ----
  observeEvent(
    eventExpr = input$info,
    handlerExpr = {
      sendSweetAlert(
        session = session,
        type = "info",
        title = "Information",
        text = "This App Template will help you get started building your own app"
      )
    }
  )
  
  ## Move to Explore Page ----
  observeEvent(
    eventExpr = input$goToExplore,
    handlerExpr = {
      updateTabItems(
        session = session,
        inputId = "pages",
        selected = "explore"
      )
    }
  )
  
  ## Move to Challenge Page ----
  observeEvent(
    eventExpr = input$goToChallenge,
    handlerExpr = {
      updateTabItems(
        session = session,
        inputId = "pages",
        selected = "challenge"
      )
    }
  )
  
  ## Move to Game Page ----
  observeEvent(
    eventExpr = input$goToGame,
    handlerExpr = {
      updateTabItems(
        session = session,
        inputId = "pages",
        selected = "game"
      )
    }
  )
  
  ##
  
  ## Move to Reference Page ----
  observeEvent(
    eventExpr = input$goToReferences,
    handlerExpr = {
      updateTabItems(
        session = session,
        inputId = "pages",
        selected = "references"
      )
    }
  )
  
  ## Timeline ----
  output$timeLine <- renderUI({
    if(input$year == "2016"){
      tags$figure(
        class = "leftFigure",
        tags$img(
          src = "pic16.jpg", 
          width = 300,
          alt = "Photo of my baby sister"),
        br(),
        br(),
        p("This is the year that my baby sister were born.")
      )
    } 
    else if(input$year == "2018"){
      tags$figure(
        class = "leftFigure",
        tags$img(
          src = "pic18.jpg", 
          width = 450,
          alt = "Photo of flute group"),
        br(),
        br(),
        p("This is the year that I first participated in the 
          band as a flute player.")
      )
    } 
    else if(input$year == "2020") {
      tags$figure(
        class = "leftFigure",
        tags$img(
          src = "pic20.jpg", 
          width = 300,
          alt = "Photo of my graduation picture with my brother and sister"),
        br(),
        br(),
        p("This is the year that I graduated from High school during Pandemic.")
      )
    } 
    else if(input$year == "2023") {
      tags$figure(
        class = "leftFigure",
        tags$img(
          src = "pic23.jpg", 
          width = 450,
          alt = "Photo of MAS admission letter"),
        br(),
        br(),
        p("This is the year that I got accpted into the M.A.S of Applied 
          Statistics with IUG program in Penn State.")
      )
    }
    else {
      p("Please select another year")
    }
  })
  
}

# Boast App Call ----
boastUtils::boastApp(ui = ui, server = server)
# Load Packages ----
library(shiny)
library(shinydashboard)
library(shinyBS)
library(shinyWidgets)
library(boastUtils)

# Load additional dependencies and setup functions ----
# source("global.R")

# Define UI for App ----
ui <- list(
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
        boastUtils::surveyLink(name = "Introducing_Luqi")
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
        menuItem("Facts", tabName = "prerequisites", icon = icon("book")),
        menuItem("Chicken Chick", tabName = "explore", icon = icon("wpexplorer")),
        menuItem("Little Game", tabName = "challenge", icon = icon("gears")),
        menuItem("Historical Moment", tabName = "game", icon = icon("gamepad")),
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
        #### Set up the Overview Page ----
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
            tags$li("Review any facts about me using the Facts Tab."),
            tags$li("See the story behind my family's chickens using the Chicken
                    Chick Tab."),
            tags$li("Challenge yourself by playing a little game using the Little 
                    Game Tab."),
            tags$li("Explore the important moments in my life using the Historical 
                    Moments Tab.")
          ),
          br(),
          ##### Go Button--location will depend on your goals
          div(
            style = "text-align: center;",
            bsButton(
              inputId = "go1",
              label = " Let's Go!",
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
        #### Set up the Prerequisites Page ----
        tabItem(
          tabName = "prerequisites",
          withMathJax(),
          h2("Facts About Me"),
          br(),
          p("Hi everyone! My name is Luqi Jiao Emanuele. Althrough the first 
            name looked like 'luqi', but It's actually pronounced as 'luchi' in 
            Chinese."),
          br(),
          box(
            title = strong("College Career"),
            status = "primary",
            collapsible = TRUE,
            collapsed = FALSE,
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
            collapsed = FALSE,
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
          )
        ),
        #### Note: you must have at least one of the following pages. You might
        #### have more than one type and/or more than one of the same type. This
        #### will be up to you and the goals for your app.
        #### Set up an Explore Page ----
        tabItem(
          tabName = "explore",
          withMathJax(),
          h2("Our Family Chickens"),
          p("This page showed the story behind my family chickens."),
          br(),
          p("During the first year of the pandemic of COVID-19, my parents were 
            afraid of running out of eggs in the supermarkets since they limited 
            how many boxes of eggs you can buy. We decided to raise the chickens 
            on our own for the eggs."),
          #tags$img(src = "chick.jpg") 
        ),
        #### Set up a Challenge Page ----
        tabItem(
          tabName = "challenge",
          withMathJax(),
          h2("Guessing Game"),
          p("From the Chick Chicken story, I will provide the picture of the 
            chickens again for you to play a little guessing game.  "),
          br(),
          p("Question: How many chickens do we have? (Hint: the amount of chickens 
            are between 10 to 20.)"),
          br(),
          tags$img(src = "chick.jpg", width = 200), 
          br(),
          tags$em("Please note, this picture does not show the correct amount of 
                  chickens.")
        ),
        #### Set up a Game Page ----
        tabItem(
          tabName = "game",
          withMathJax(),
          h2("Explore the Timeline"),
          p(""),
        ),
        #### Set up the References Page ----
        tabItem(
          tabName = "references",
          withMathJax(),
          h2("References"),
          p("You'll need to fill in this page with all of the appropriate
            references for your app."),
          p(
            class = "hangingindent",
            "Bailey, E. (2015). shinyBS: Twitter bootstrap components for shiny.
            (v0.61). [R package]. Available from
            https://CRAN.R-project.org/package=shinyBS"
          ),
          br(),
          br(),
          br(),
          boastUtils::copyrightInfo()
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


}

# Boast App Call ----
boastUtils::boastApp(ui = ui, server = server)

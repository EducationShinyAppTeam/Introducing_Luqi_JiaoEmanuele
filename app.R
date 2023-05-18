# Load Packages ----
library(shiny)
library(shinydashboard)
library(shinyBS)
library(shinyWidgets)
library(boastUtils)

# Load additional dependencies and setup functions
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
        menuItem("Prerequisites", tabName = "prerequisites", icon = icon("book")),
        menuItem("Example", tabName = "example", icon = icon("book-open-reader")),
        menuItem("Explore", tabName = "explore", icon = icon("wpexplorer")),
        menuItem("Challenge", tabName = "challenge", icon = icon("gears")),
        menuItem("Game", tabName = "game", icon = icon("gamepad")),
        menuItem("Wizard", tabName = "wizard", icon = icon("hat-wizard")),
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
            tags$li("View the prerequiste using the Prerequistes Tab."),
            tags$li("Review any facts about me using the Explore Tab."),
            tags$li("Challenge yourself by playing a little game behind a story 
                    using the Challenge Tab."),
            tags$li("Playing a game to explore the important moments in my life 
                    using the Game Tab.")
          ),
          ##### Go Button--location will depend on your goals
          div(
            style = "text-align: center;",
            bsButton(
              inputId = "go1",
              label = "GO!",
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
          h2("Prerequisites"),
          p("In order to get the most out of this app, please review the
            following:"),
          tags$ul(
            tags$li("Pre-req 1--Technical/Conceptual Prerequisites are ideas that
                    users need to have in order to engage with your app fully."),
            tags$li("Pre-req 2--Contextual Prerequisites refer to any information
                    about a context in your app that will enrich a user's
                    understandings."),
            tags$li("Pre-req 3"),
            tags$li("Pre-req 4")
          ),
          p("Notice the use of an unordered list; users can move through the
            list any way they wish."),
          box(
            title = strong("Null Hypothesis Significance Tests (NHSTs)"),
            status = "primary",
            collapsible = TRUE,
            collapsed = TRUE,
            width = '100%',
            "In the Confirmatory Data Analysis tradition, null hypothesis
            significance tests serve as a critical tool to confirm that a
            particular theoretical model describes our data and to make a
            generalization from our sample to the broader population
            (i.e., make an inference). The null hypothesis often reflects the
            simpler of two models (e.g., 'no statistical difference',
            'there is an additive difference of 1', etc.) that we will use to
            build a sampling distribution for our chosen estimator. These
            methods let us test whether our sample data are consistent with this
            simple model (null hypothesis)."
          ),
          box(
            title = strong(tags$em("p"), "-values"),
            status = "primary",
            collapsible = TRUE,
            collapsed = FALSE,
            width = '100%',
            "The probability that our selected estimator takes on a value at
            least as extreme as what we observed given our null hypothesis. If
            we were to carry out our study infinitely many times and the null
            hypothesis accurately modeled what we're studying, then we would
            expect for our estimator to produce a value at least as extreme as
            what we have seen 100*(p-value)% of the time. The larger the
            p-value, the more often we would expect our estimator to take on a
            value at least as extreme as what we've seen; the smaller, the less
            often."
          )
        ),
        #### Note: you must have at least one of the following pages. You might
        #### have more than one type and/or more than one of the same type. This
        #### will be up to you and the goals for your app.
        #### Set up an Explore Page ----
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
          ),
        ),
        #### Set up a Challenge Page ----
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
          p("On this type of page, you'll set up a game for the user to play.
            Game types include Tic-Tac-Toe, Matching, and a version Hangman to
            name a few. If you have ideas for new game type, please let us know.")
        ),
        #### Set up a Wizard Page ----
        tabItem(
          tabName = "wizard",
          withMathJax(),
          h2("Wizard"),
          p("This page will have a series of inputs and questions for the user to
            answer/work through in order to have the app create something. These
            types of Activity pages are currently rare as we try to avoid
            creating 'calculators' in the BOAST project.")
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
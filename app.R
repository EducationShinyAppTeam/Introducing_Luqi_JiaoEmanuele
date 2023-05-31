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
      title = "Introducing Luqi", 
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
          h1("Introducing Luqi Jiao Emanuele"), 
          p("This is a sample Shiny application for BOAST. Which will introduce 
            to you who Luqi Jiao Emanuele is."),
          br(),
          h2("Instructions"),
          p("The following pages are for you to feel free to explore!"),
          tags$ol(
            tags$li("Review any facts about me using the Explore Tab."),
            tags$li("Challenge yourself based on a story using the Challenge Tab."),
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
          h2("Acknowledgements"),
          p(
            "This version of the app was developed and coded by Luqi Jiao Emanuele.",
            br(),
            "Cite this app as:",
            br(),
            citeApp(),
            br(),
            div(class = "updated", "Last Update: 5/25/2023 by LJE.")
          )
        ),
        #### Explore Page ----
        tabItem(
          tabName = "explore",
          withMathJax(),
          h2("Facts About Me"),
          p("Hi everyone! My name is Luqi Jiao Emanuele. Although my first 
            name looks like 'luqi', but it's actually pronounced as 'lu-CHI' in 
            Chinese."),
          br(),
          tags$figure(
            class = "centerFigure",
            tags$img(
              src = "photo.jpeg", 
              width = 300,
              alt = "Headshot of Luqi"),
            tags$figcaption("Luqi Jiao Emanuele"),
            br(),
            box(
              title = strong("College Career"),
              status = "primary",
              collapsible = TRUE,
              collapsed = TRUE,
              width = '100%',
              "I will be a senior student at Penn State, studying the following 
            majors:", 
            br(),
            tags$ul(
              tags$li("B.S. in Economics"),
              tags$li("B.S. in Statistics with Applied Option")
            ),
            br(),
            "Also, I will be a first year student studying a M.A.S. in Applied 
            Statistics in the Integrated Undergraduate/Graduate Program in the 
            summer. This allows me to graduate with my Bachelor's degree and my 
            Master's degree.", 
            br(),
            "If you need any suggestion about course or major, please feel free 
            to reach out to me. I would love to help you out!"
            ),
            box(
              title = strong("Personal Life"),
              status = "primary",
              collapsible = TRUE,
              collapsed = TRUE,
              width = '100%',
              "In my spare time, I would like to do the following things:",
              br(),
              tags$ul(
                tags$li("Hanging out with friends"),
                tags$li("Watching animations"), 
                tags$li("Cooking Chinese and Italian food"),
                tags$li("Playing video games"), 
                tags$li("Planting vegetables")
              ),
              br(),
              "If you have any good animations or video games suggestions, 
                    please let me know!"
            ),
            br(),
            p("Please use the button below to expore a challenge game behind a story."),
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
          )
        ),
        #### Challenge Page ----
        tabItem(
          tabName = "challenge",
          withMathJax(),
          h2("Our Family Chickens"),
          p("This page is showing a story behind my family chickens with a challange"),
          br(),
          p("During the first year of the pandemic of COVID-19, my parents were 
            afraid of running out of eggs in the supermarkets since they limited 
            how many boxes of eggs you can buy. We decided to raise the chickens 
            on our own for the eggs."),
          p("In the beginning, we had 8 chickens, but my parents were afraid of 
            we couldn't get enough eggs for a family of six. So, we decided to 
            buy 15 more. However, we realized eggs from the 23 chickens are too 
            many for our family. Which caused us to give the extra eggs to the 
            neighbors and spend more money on chicken feed. Therefore, we decided 
            to send some chickens to our neighbors."),
          br(),
          tags$figure(
            class = "centerFigure",
            tags$img(
              src = "chick.jpg", 
              width = 300,
              alt = "Photo of the chickens"),
            tags$figcaption("Chicken in the Backyard"),
          ),
          br(),
          tags$strong("Question: How many chickens do we have now?"),
          br(),
          tags$em("(Hint: the amount of chickens are between 10 to 20.)"),
          br(),
          "Please note, this picture does not show the correct amount of 
                  the chickens.",
          fluidRow(
            column(
              width = 5,
              offset = 0,
              wellPanel(
                numericInput(
                  inputId = "selectNumber",
                  label = "Select a number:",
                  value = 10,
                  max = 20,
                  min = 10
                ),
                bsButton(
                  inputId = "submit",
                  label = "Submit",
                  size = "large",
                  style = "default"
                ),
              )
            ),
            column(
              width = 6,
              offset = 1,
              br(),
              uiOutput("result"),
              renderIcon(),
            )
          ),
          br(),
          p("Use the button below to explore a game of a timeline."),
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
          ),
        ),
        #### Game Page ----
        tabItem(
          tabName = "game",
          withMathJax(),
          h2("Explore the Timeline"),
          p("On this page, you will explore different years to see some 
            of the important things happened in my life!"), 
          br(),
          fluidRow(
            column(
              width = 12,
              wellPanel(
                sliderInput(
                  inputId = "year",
                  label = "Select a year:",
                  min = 2016,
                  max = 2023,
                  value = 2016,
                  step = 1,
                  sep = ""
                )
              ),
              uiOutput("timeLine")
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
            p(      #shinya11y
              class = "hangingindent",
              "Henderson E, Scales J, Yates J (2023). _shinya11y: Accessibility (a11y) Tooling for
            'Shiny'_. R package version 0.0.0.9000."
            ),
            p(     #shinyWidgets
              class = "hangingindent",
              "Perrier, V., Meyer, F., Granjon, D., Fellows, I., and Davis, W.
            (2020), shinyWidgets: Custom Inputs Widgets for Shiny, R package.
            Available from
            https://cran.r-project.org/web/packages/shinyWidgets/index.html"
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
        text = "This App will introduce Luqi to you."
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
  
  ## Challenge result ----
  observeEvent(input$submit,{
    if (!is.null(input$selectNumber)) {
      correct <- input$selectNumber == 11 
      
      if (correct) {
        output$result <- boastUtils::renderIcon(icon = "correct", width = 80)
      } else {
        output$result <- boastUtils::renderIcon(icon = "incorrect", width = 80)
      }
    }
  })
  
  ## Timeline ----
  output$timeLine <- renderUI({
    if(input$year == "2016"){
      tags$figure(
        class = "centerFigure",
        tags$img(
          src = "pic16.jpg", 
          width = 350,
          alt = "Photo of my baby sister"),
        tags$figcaption("My Baby Sister Kiara"),
        br(),
        br(),
        p("This is the year that my baby sister was born. She is very cute and 
          energetic. Brings a lot of fun especially since we were quarantined at
          home during the pandemic.")
      )
    } 
    else if(input$year == "2017"){
      tags$figure(
        class = "centerFigure",
        tags$img(
          src = "pic17.jpg", 
          width = 450,
          alt = "Photo of Metropolitan Museum"),
        tags$figcaption("Metropolitan Museum in NYU"),
        br(),
        br(),
        p("This is the year that I went toe see the Metropolitan museum in New 
          York city for the first time.")
      )
    } 
    else if(input$year == "2018"){
      tags$figure(
        class = "centerFigure",
        tags$img(
          src = "pic18.jpg", 
          width = 600,
          alt = "Photo of flute group"),
        tags$figcaption("Flute Section in Marching Band"),
        br(),
        br(),
        p("This is the year that I first participated in the High school band as
          a flute player. Later, I also played tenor saxophone. This is the picture
          of the flute section token before a football game of the marching band.")
      )
    } 
    else if(input$year == "2019"){
      tags$figure(
        class = "centerFigure",
        tags$img(
          src = "pic19.jpg", 
          width = 300,
          alt = "Photo of me with friends at prom"),
        tags$figcaption("My Friends and I at Prom"),
        br(),
        br(),
        p("This is the year that I went to high shcool prom first time with friends.")
      )
    } 
    else if(input$year == "2020") {
      tags$figure(
        class = "centerFigure",
        tags$img(
          src = "pic20.jpg", 
          width = 350,
          alt = "Photo of my graduation picture with my brother and sister"),
        tags$figcaption("Graduation Photo with My Brother and Sister"),
        br(),
        br(),
        p("This is the year that I graduated from High school during the Pandemic. 
          Since I didn't go to the visual graduation ceremony, so we decided to 
          take photos of me with my brother and sister on our driveway. ")
      )
    } 
    else if(input$year == "2021"){
      tags$figure(
        class = "centerFigure",
        tags$img(
          src = "pic21.jpg", 
          width = 400,
          alt = "Photo of Harry Graduation"),
        tags$figcaption("Harry Grduation at Home"),
        br(),
        br(),
        p("This is the year that my brother Harry graduated from high school. 
          Since our family did not get the COVID vaccine, so we decided not to 
          participate in the ceremony in person.")
      )
    } 
    else if(input$year == "2022"){
      tags$figure(
        class = "centerFigure",
        tags$img(
          src = "pic22.jpg", 
          width = 400,
          alt = "Photo of Penn State Building"),
        tags$figcaption("Millennium Science Complex Building at Penn State"),
        br(),
        br(),
        p("This is the year that I first visited the Penn State University Park 
          campus after two years of quarantine and spend my freshman and sophomore 
          at home. ")
      )
    }
    else {
      tags$figure(
        class = "centerFigure",
        tags$img(
          src = "pic23.jpg", 
          width = 500,
          alt = "Photo of MAS admission letter"),
        tags$figcaption("MAS Admission letter from Penn State"),
        br(),
        br(),
        p("This is the year that I got accepted into the M.A.S of Applied 
          Statistics with the Integrated Undergraduate/Graduate program in Penn 
          State. This allows me to achieve a Graduate degree while finishing my 
          undergraduate degrees.")
      )
    }
  }
  )
}
# Boast App Call ----
boastUtils::boastApp(ui = ui, server = server)
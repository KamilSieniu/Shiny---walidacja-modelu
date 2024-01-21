```r

library(shiny)
library(ggplot2)
library(combinat)
library(gridExtra)
library(nortest)
library(lmtest)
library(readr)

ui <- fluidPage(
  titlePanel("Interaktywna regresja liniowa z wyborem modelu"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Wybierz plik CSV:", accept = c("text/csv", "text/comma-separated-values,text/plain")),
      selectInput("dependent_var", "Wybierz zmienną zależną:", ""),
      selectInput("criterion", "Wybierz kryterium informacyjne według, którego dobierany ma być najlepsy model:", c("AIC", "BIC")),
      sliderInput("alpha", "Wybierz poziom istotności:", min = 0.01, max = 0.1, value = 0.05, step = 0.01),
      sliderInput("min_r2", "Minimalna wartość R^2:", min = 0, max = 1, value = 0, step = 0.01),
      checkboxInput("normality_test", "Uwzględnij test normalności reszt", FALSE),
      checkboxInput("homoskedasticity_test", "Uwzględnij test homoskedastyczności reszt", FALSE),
      actionButton("run_model", "Uruchom model"),
      textInput("predict_values", "Wprowadź wartości dla predykcji (format: var1=val1, var2=val2, ...):"),
      actionButton("predict", "Dokonaj predykcji"),
      textOutput("prediction_result")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Podsumowanie modelu", 
                 textOutput("best_model_summary"),
                 textOutput("p_values_summary"),
                 textOutput("r2_value"),
                 textOutput("test_results"),
                 plotOutput("plots")),
        tabPanel("Diagnostyka", plotOutput("diagnostics"))
      )
    )
  )
)

server <- function(input, output, session) {
  best_model <- NULL
  data <- reactiveVal(mtcars)
  
  observe({
    inFile <- input$file1
    if (is.null(inFile)) return(NULL)
    newData <- read_csv(inFile$datapath)
    data(newData)
    updateSelectInput(session, "dependent_var", choices = colnames(newData))
  })
  
  observeEvent(input$run_model, {
    model_found <- F
    df <- data()
    dependent_var <- input$dependent_var
    all_vars <- colnames(df)
    all_vars <- setdiff(all_vars, dependent_var)
    
    best_criterion_value <- Inf
    best_vars <- NULL
    best_p_values <- NULL
    best_r2 <- NULL
    normality_p_value <- NA
    homoskedasticity_p_value <- NA
    
    for(k in 1:(length(all_vars))) {
      combinations <- combn(all_vars, k, simplify = FALSE)
      
      for(current_vars in combinations) {
        formula <- as.formula(paste(dependent_var, "~", paste(current_vars, collapse = " + ")))
        
        fit <- lm(formula, data = df)
        fit_summary <- summary(fit)
        
        r2_value <- fit_summary$r.squared
        if(r2_value < input$min_r2) next 
        
        p_values <- coef(fit_summary)[, 4]
        max_p_value <- max(p_values[-1])
        
        if(max_p_value > input$alpha) next 
        
        if(max_p_value > input$alpha) next # Sprawdzanie p-wartości
        # Testy normalności i homoskedastyczności
        if(input$normality_test) {
          normality_p_value <- ad.test(fit$residuals)$p.value
          if(normality_p_value < input$alpha) next
        }
        
        if(input$homoskedasticity_test) {
          homoskedasticity_p_value <- bptest(fit)$p.value
          if(homoskedasticity_p_value < input$alpha) next
        }
        
        
        selected_criterion <- if (input$criterion == "AIC") AIC(fit) else BIC(fit)
        
        if(selected_criterion < best_criterion_value) {
          best_criterion_value <- selected_criterion
          best_model <<- fit
          best_vars <- current_vars
          best_p_values <- p_values[-1]
          best_r2 <- r2_value
          model_found <- T
        }
      }
    }
    
    output$best_model_summary <- renderText({
      paste("Najlepszy model według", input$criterion, "ma wartość", round(best_criterion_value, 2),
            "i używa zmiennych:", paste(best_vars, collapse = ", "))
    })
    
    output$p_values_summary <- renderText({
      paste("P-wartości dla zmiennych w najlepszym modelu są:", paste(round(best_p_values, 5), collapse = ", "))
    })
    
    output$r2_value <- renderText({
      paste("Wartość R^2 dla najlepszego modelu wynosi:", round(best_r2, 4))
    })
    
    output$test_results <- renderText({
      normality_text <- ifelse(is.na(normality_p_value), "brak danych", round(normality_p_value, 5))
      homoskedasticity_text <- ifelse(is.na(homoskedasticity_p_value), "brak danych", round(homoskedasticity_p_value, 5))
      
      paste("P-wartość dla testu normalności reszt wynosi:", normality_text,
            "a dla testu homoskedastyczności reszt wynosi:", homoskedasticity_text)
    })
    
    output$plots <- renderPlot({
      if(length(best_vars) > 1) {
        plots <- lapply(best_vars, function(var) {
          ggplot(df, aes_string(x = var, y = dependent_var)) +
            geom_point() +
            geom_smooth(method = "lm", se = FALSE)
        })
        do.call(grid.arrange, c(plots, nrow = 1))
      } else {
        ggplot(df, aes_string(x = best_vars[1], y = dependent_var)) +
          geom_point() +
          geom_smooth(method = "lm", se = FALSE)
      }
    })
    
    output$diagnostics <- renderPlot({
      par(mfrow=c(2,2))
      plot(best_model)
    })
    
    if (!model_found) {
      showModal(modalDialog(
        title = "Błąd",
        "Użytkowniku! Przy podanych parametrach nie jest możliwe stworzenie modelu. Wybierz inne!",
        easyClose = TRUE,
        footer = NULL
      ))
    } else {
      # ... (reszta kodu, która się wykona, jeśli model został znaleziony)
    }
    
  })
  
  observeEvent(input$predict, {
    if (is.null(best_model)) return(NULL)
    
    predict_str <- input$predict_values
    predict_list <- strsplit(predict_str, ",\\s*")[[1]]
    predict_values <- list()
    
    for (item in predict_list) {
      key_val <- strsplit(item, "=")[[1]]
      if (length(key_val) == 2) {
        predict_values[[key_val[1]]] <- as.numeric(key_val[2])
      }
    }
    
    prediction <- predict(best_model, newdata = as.data.frame(predict_values))
    output$prediction_result <- renderText({
      paste("Wynik predykcji:", round(prediction, 4))
    })
  })
}

shinyApp(ui = ui, server = server)

```

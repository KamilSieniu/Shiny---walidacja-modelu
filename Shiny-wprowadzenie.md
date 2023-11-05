# Shiny – framework aplikacji internetowych dla języka R

## Czym jest Shiny?

Shiny to pakiet, który umożliwia tworzenie interaktywnych stron internetowych w formie aplikacji, które zasilane są przez działający na serwerze kod R (w tle). Dzięki temu możliwe jest wykorzystanie statystycznych i graficznych możliwości tego języka. Używając kodu w R, tworzy się interfejs użytkownika i serwer, a Shiny kompiluje go do HTML, CSS i JavaScriptu potrzebnych do wyświetlenia aplikacji w sieci. Użytkownicy mogą poprzez stronę wybierać parametry przetwarzania według swoich potrzeb. Dane i parametry są przetwarzane na serwerze a wynik jest przedstawiany ponownie na stronie internetowej. Głównym zadaniem jest umożliwienie analitykom danych prezentowania wyników analiz w przystępny, dynamiczny sposób, bez konieczności zagłębiania się w złożoności programowania webowego.

Zespół, który zajmował się tworzeniem pakietu Shiny od podstaw, składał się z około 40 osób i firm, a osobą odpowiedzialną za prowadzenie i zarządzanie tym projektem jest Winston Chang. 

## Jak działa Shiny - budowa

Aplikacja w Shiny zakłada się z trzech podstawowych elementów po zainstalowaniu pakietu ``` shiny ```.

1\) Obiekt interfejsu użytkownika ```ui``` definiuje, jak aplikacja będzie wyglądać i jakie elementy będą dostępne dla użytkownika, takie jak wykresy, tabelki czy suwaki do wyboru parametrów. 

``` 
# Zdefiniuj ----
ui <- fluidPage(

  # App title ----
  titlePanel("Hello Shiny!"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Histogram ----
      plotOutput(outputId = "distPlot")

    )
  )
)
```

2\) Funkcja ```server``` zawiera instrukcje potrzebne komputerowi do zbudowania aplikacji.
```
shinyServer(
  function(input, output) {
  }
)
```

3\) Na koniec funkcja ```shinyApp``` tworzy obiekty aplikacji Shiny z jawnej pary interfejs użytkownika/serwer.
```r
# See above for the definitions of ui and server
ui <- ...

server <- ...

shinyApp(ui = ui, server = server)
```

## Jak działa Shiny?

Shiny opiera się na dwóch głównych komponentach: interfejsie użytkownika (UI) i serwerze. UI określa wygląd aplikacji i dostępne elementy, takie jak wykresy czy suwaki. Serwer to "serce" aplikacji, gdzie dane są przetwarzane i gdzie reaguje się na działania użytkownika.

### Programowanie reaktywne w Shiny

Shiny wykorzystuje programowanie reaktywne, które pozwala aplikacjom automatycznie aktualizować wyniki w odpowiedzi na zmiany parametrów wejściowych użytkownika. To podejście umożliwia prowadzenie interaktywnych analiz.

Shiny jest elastyczny i może być używany do tworzenia zarówno prostych aplikacji wizualizacyjnych, jak i zaawansowanych narzędzi analitycznych. Pakiet integruje się z innymi pakietami w R, rozszerzając możliwości statystyczne i graficzne.

## Zastosowania Shiny

Shiny jest używany do:

- Tworzenia pulpitów nawigacyjnych.
- Zastępowania statycznych raportów interaktywnymi aplikacjami.
- Prezentowania skomplikowanych modeli za pomocą wizualizacji.
- Udostępniania zaawansowanych analiz R użytkownikom bez umiejętności programowania.
- Tworzenia interaktywnych narzędzi edukacyjnych z zakresu statystyki i nauki o danych.

## Programowanie reaktywne w Shiny

Shiny wykorzystuje programowanie reaktywne do strukturyzowania logiki aplikacji. Zmiana wartości wejściowych powoduje automatyczne ponowne wykonanie odpowiednich części kodu R, co aktualizuje wyniki.

### Obiekty w programowaniu reaktywnym Shiny

- **Źródła reaktywne**: Dane wejściowe użytkownika.
- **Punkty końcowe reaktywne**: Elementy wyświetlane w przeglądarce, np. wykresy.
- **Przewodniki reaktywne**: Logika serwera wykorzystująca programowanie reaktywne.

### Niezależność sesji użytkownika

W Shiny każda sesja użytkownika jest niezależna. Funkcja `server()` jest wywoływana dla każdej nowej sesji, tworząc unikalne środowisko i stan dla każdego użytkownika.

---


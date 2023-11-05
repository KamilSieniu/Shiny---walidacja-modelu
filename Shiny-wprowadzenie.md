# Shiny – framework aplikacji internetowych dla języka R

## Czym jest Shiny?

Shiny to pakiet, który umożliwia tworzenie interaktywnych stron internetowych w formie aplikacji, które zasilane są przez działający na serwerze kod R (w tle). Dzięki temu możliwe jest wykorzystanie statystycznych i graficznych możliwości tego języka. Używając kodu w R, tworzy się interfejs użytkownika i serwer, a Shiny kompiluje go do HTML, CSS i JavaScriptu potrzebnych do wyświetlenia aplikacji w sieci. Użytkownicy mogą poprzez stronę wybierać parametry przetwarzania według swoich potrzeb. Dane i parametry są przetwarzane na serwerze a wynik jest przedstawiany ponownie na stronie internetowej. Głównym zadaniem jest umożliwienie analitykom danych prezentowania wyników analiz w przystępny, dynamiczny sposób, bez konieczności zagłębiania się w złożoności programowania webowego.

Zespół, który zajmował się tworzeniem pakietu Shiny od podstaw, składał się z około 40 osób i firm, a osobą odpowiedzialną za prowadzenie i zarządzanie tym projektem jest Winston Chang. 

## Jak działa Shiny
### Budowa

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

2\) Funkcja ```server``` natomiast jest sercem aplikacji, gdzie przetwarzane są dane i reaguje się na działania użytkownika, wykonując kod R, więc zawiera instrukcje potrzebne komputerowi do zbudowania aplikacji.
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


### Programowanie reaktywne 

Jak widać Shiny jest wyposażony w bibliotekę programowania reaktywnego, którą używa się do strukturyzowania logiki aplikacji. Korzystając z tej biblioteki, zmiana wartości wejściowych naturalnie powoduje ponowne wykonanie odpowiednich części kodu R, co z kolei powoduje aktualizację zmienionych wyników. Model programowania reaktywnego eliminuje potrzebę dodatkowego kodu obsługi zdarzeń. 

W Shiny istnieją trzy rodzaje obiektów w programowaniu reaktywnym: źródła reaktywne, punkty końcowe reaktywne i przewodniki reaktywne. 

Źródła i punkty końcowe reaktywne: Najprostsza struktura programu reaktywnego obejmuje tylko źródło i punkt końcowy. W aplikacji Shiny źródłem zwykle są dane wejściowe użytkownika przez interfejs przeglądarki. Na przykład, gdy użytkownik wybiera element, wpisuje dane lub klika przycisk, te działania ustawiają wartości, które są źródłami reaktywnymi. Reaktywny punkt końcowy to zazwyczaj coś, co pojawia się w oknie przeglądarki użytkownika, takie jak wykres lub tabela wartości. 

```ui``` jest proste, ponieważ każdy użytkownik otrzymuje ten sam HTML. ```serwer``` jest bardziej skomplikowany, ponieważ każdy użytkownik musi otrzymać niezależną wersję aplikacji; gdy użytkownik A przesuwa suwak, użytkownik B nie powinien zobaczyć zmiany swoich wyników. 
Aby osiągnąć tę niezależność, Shiny wywołuje funkcję server() za każdym razem, gdy zaczyna się nowa sesja. Podobnie jak w przypadku każdej innej funkcji R, gdy funkcja serwera jest wywoływana, tworzy nowe lokalne środowisko niezależne od każdego innego wywołania funkcji. Pozwala to każdej sesji mieć unikalny stan, a także izoluje zmienne utworzone wewnątrz funkcji. Dlatego prawie całe programowanie reaktywne, które wykonasz w Shiny, będzie wewnątrz funkcji serwera. 

### Przegląd kontrolek



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


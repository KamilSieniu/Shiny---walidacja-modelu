# Shiny – framework aplikacji internetowych dla języka R

## Czym jest Shiny?

Shiny to pakiet, który umożliwia tworzenie interaktywnych stron internetowych w formie aplikacji, które zasilane są przez działający na serwerze kod R (w tle). Dzięki temu możliwe jest wykorzystanie statystycznych i graficznych możliwości tego języka. Używając kodu w R, tworzy się interfejs użytkownika i serwer, a Shiny kompiluje go do HTML, CSS i JavaScriptu potrzebnych do wyświetlenia aplikacji w sieci. Użytkownicy mogą poprzez stronę wybierać parametry przetwarzania według swoich potrzeb. Dane i parametry są przetwarzane na serwerze a wynik jest przedstawiany ponownie na stronie internetowej. Głównym zadaniem jest umożliwienie analitykom danych prezentowania wyników analiz w przystępny, dynamiczny sposób, bez konieczności zagłębiania się w złożoności programowania webowego.

Swój udział w budowaniu pakietu na przestrzeni lat miało około 40 osób i firm, a osobą odpowiedzialną za prowadzenie i zarządzanie tym projektem jest Winston Chang. 

## Jak działa Shiny?
### Budowa

Aplikacja w Shiny zakłada się z trzech podstawowych elementów po zainstalowaniu pakietu ``` shiny ```.

1\) Obiekt interfejsu użytkownika ```ui``` definiuje, jak aplikacja będzie wyglądać i jakie elementy będą dostępne dla użytkownika, takie jak wykresy, tabelki czy suwaki do wyboru parametrów. 

``` 
# Zdefiniowanie interfejsu użytkownika dla aplikacji rysującej histogram ----
ui <- fluidPage(

  # Tytuł aplikacji ----
  titlePanel("Histogram Shiny!"),

  # Układ boczny z definicjami wejść i wyjść ----
  sidebarLayout(

    # Panel boczny dla wejść ----
    sidebarPanel(

      # Wejście: Suwak dla liczby przedziałów ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)

    ),

    # Główny panel do wyświetlania wyników ----
    mainPanel(

      # Wyjście: Histogram ----
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

![Obraz1](https://github.com/KamilSieniu/Shiny---walidacja-modelu/blob/f42e7d1196f863006e90e02145a057e25066b787/MicrosoftTeams-image.png)

## Zastosowania Shiny

Shiny jest używany do:


* Tworzenia pulpitów nawigacyjnych, które śledzą ważne wskaźniki wydajności na wysokim poziomie, jednocześnie ułatwiając dokładne zbadanie metryk, które wymagają dalszego dochodzenia.
* Zastępowania setek stron PDF interaktywnymi aplikacjami, które pozwalają użytkownikowi przejść do dokładnie tego fragmentu wyników, który go interesuje. 
* Przedstawiania skomplikowanych modeli niefachowym odbiorcom za pomocą informacyjnych wizualizacji i interaktywnej analizy. 
* Możesz udostępnić zaawansowane analizy R użytkownikom nieposiadającym umiejętności programowania. 
* Tworzenia interaktywnych aplikacji do nauczania statystyki i pojęć związanych z nauką o danych, które pozwalają uczącym się modyfikować dane wejściowe i obserwować efekty tych zmian w analizie. 

Jak widać Shiny jest niezwykle elastyczny – można go używać do tworzenia prostych aplikacji służących do wizualizacji danych, jak również skomplikowanych narzędzi analitycznych wykorzystywanych w przedsiębiorstwach do podejmowania decyzji biznesowych. Pakiet ten doskonale integruje się z innymi pakietami w R, co pozwala na wykorzystanie szerokiej gamy metod statystycznych i graficznych dostępnych w tym języku. Warto również wspomnieć, że Shiny wspiera prace grupowe i jest przystosowany do pracy w środowisku sieciowym. Aplikacje Shiny mogą być hostowane na lokalnych serwerach, w chmurze (na przykład na platformie ShinyApps.io) lub bezpośrednio z RStudio Server, co ułatwia współdzielenie aplikacji z innymi użytkownikami. 

## Przykłady
* [Czas trwania erupcji gejzera](https://gallery.shinyapps.io/083-front-page/)
* [Oceny seriali](http://mi2.mini.pw.edu.pl:8080/Przewodnik/seriale/)
* [Wydatki na zdrowie a oczekiwana długość życia w 1995](https://gallery.shinyapps.io/182-google-charts/)
* [Rak trzustki - przeglądarka genomu](https://gallery.shinyapps.io/genome_browser/)

## Bibliografia
* https://shiny.posit.co/r/gallery/ [wybrane przykłady]
* https://www.cs.put.poznan.pl/alabijak/emd/08_Aplikacje_dla_uzytkownikow.html#/26
* https://shiny.posit.co/r/getstarted/build-an-app/customizing-ui/interface.html
* https://mastering-shiny.org/

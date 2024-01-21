# 1. Charakterystyka oprogramowania </br>
  **Nazwa skrócona:** Diagnostyk Modelu </br>
  **Nazwa pełna:** Aplikacja służąca do uproszczonej walidacji odpowiedniego modelu liniowego dla dowolonych danych </br>
  **Opis:** Narzędzie generuje modele ze wszystkich możliwych kombinacji liniowych z dowolnych danych wsadowych (odpowiednio przygotowanych). Użytkownik ma możliwość wybrać, jaka zmienna będzie przewidywana. Narzędzie to pozwala w czasie rzeczywistym wybierać najlepszy model dla podanych przez Użytkownika parametrów oraz przedstawia diagnostykę modelu. Dodatkową funkcją jest możliwość wykonania predykcji dla zmiennej zależnej i otrzymanie wyniku w czasie rzeczywistym. Całość jest w postaci aplikacji z bogatym interfejsem. 

# 2. Prawa autorskie </br>
  **Autorzy:** Kamil Sieniawski, Joanna Starosta, Michał Bujnowski </br>
  **Licencja:** *Creative Common Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0)* </br>
  Darmowe użytkowanie, kopiowanie, rozpowszechnianie i modyfikowanie oprogramowania są dozwolone pod warunkiem przypisania odpowiedniego uznania autorstwa, braku użycia korporacyjnego oraz udostępniania utworów pochodnych na tych samych warunkach.

# 3. Specyfikacja wymagań
 
  | Identyfikator | Nazwa | Opis | Priorytet| Kategoria |
|------|------|------|------|------|
| **A** | **Załadowanie pliku z danymi** | | |
| A1 | Odpowiedni format pliku | Plik powinien być w formacie CSV | Wymagane | Funkcjonalne |
| A2 | Odpowiednia struktura danych | Separatorem kolumn musi być przecinek, a części dziesiętne powinny być rozdzielone kropką | Wymagane | Funkconalne |
| A3 | Postępowanie z brakami danych | Dane nie powinny zawierać braków. Jeśli jednak wystąpią, algorytm zinterpretuje je jako oddzielną kategorię zmiennej | Przydatne | Funkcjonalne |
| A4 | Odpowiednia struktura nagłówków kolumn | Nazwy nagłówków nie powinny zawierać spacji | Wymagane | Funkcjonalne |
| **B** | **Wybór parametrów do analizy** | | |
| B1 | Wybór zmiennej zależnej | Zmienna zależna musi być numeryczna. W innym przypadku nastąpi zamknięcie aplikacji | Wymagane | Funkcjonalne |
| B2 | Zmiana parametrów | Po zmienie filtrów i parametrów należy ponownie wcisnąć przycisk "Uruchom model" | Wymagane | Funkcjonalne |
| B3 | Wybór testów | Po zaznaczeniu dowolnego checkboxa z testami, aplikacja jedynie wyznacza p-wartości dla testów - nie wpływa to na wybór najlepszego modelu | Opcjonalne | Funkcjonalne |
| **C** | **Predykcje** | | |
| C1 | Przeprowadzenie predykcji | Należy w odpowiedni, podany w aplikacji sposób wpisywać warunki do predykcji. Następnie należy wcisnąć przycisk "Dokonaj predykcji". | Wymagane | Funkcjonalne |
| C2 | Ograniczenie predykcji | Aplikacja nie dokona predykcji dla zmiennej kategoryzowanej | Wymagane | Funkcjonalne |
| **D** | **Program aplikacji** | | |
| D1 | Instalacja bibliotek | Program aplikacji załadowanie bibliotek, jednak wymagane jest, aby Użytkownik miał je już zainstalowane w wersjach ze specyfikacji | Wymagane | Funkcjonalne |
| D2 | Posiadanie odpowiednich wersji programów | Użytkownik powinien mieć zainstalowaną wersję języka R oraz RStudio podane w specyfikacji | Zalecane | Funkcjonalne |
| D3 | Uruchomienie programu | Kod do uruchumienia aplikacji należy wywołać w R Script lub R Markdown (w jednym Chank-u) | Wymagane | Funkcjonalne |
| **E** | **Działania z poziomu interfejsu użytkownika** | | |
| E1 | Wgranie wybranego pliku | Program powinien wgrać dane | Wymagane | Funkcjonalne |
| E2 | Możliwość wybrania odpowiednich parametrów | Program powinien dać możliwość zmiany kryteriów za pomocą suwaków, list i checkboxów | Wymagane | Funkcjonalne |
| E3 | Aktualizacje modelu | Program powinien po kliknięciu "Uruchom model" aktualizować model | Wymagane | Funkcjonalne | 
| E4 | Aktualizacje treści | Program powinien aktualizować wartości wynikowe umieszczone w tekście nad wykresami oraz same wizualizacje po kliknięciu "Uruchom model" | Wymagane | Funkcjonalne | 
| E5 | Poruszanie po zakładkach aplikacji | Program powinien umożliwiać zmianę zakładek "Podsumowanie modelu" oraz "Diagnostyka" | Wymagane | Funkcjonalne |
| E6 | Wyliczanie predykcji | Program po kliknięciu "Dokonaj predykcji dla wartości numerycznych powinien wyliczyć wartość zmiennej zależnej według modelu | Wymagane | Funkcjonalne |
| E6 | Przejrzystość | Interfejs użytkownika powinien być przejrzysty i łatwy do odczytania - powienien zapewniać swobodę oraz możliwość zrozumienia działania oprogramowania | Wymagane | Pozafunkcjonalne |
| E7 | Dostępność | Program powinien umożliwić użytkownikowi sprawne korzystanie z aplikacji - odpowiednio dobrany model według wybranych parametrów powinien być wyliczony w ciągu kilku sekund | Wymagane | Poza funkcjonalne |

# 4. Architektura systemu/oprogramowania </br>
  **Architektura rozwoju - stos technologiczny** </br>
      R (wersja 4.2.1), </br>
      R Studio (wersja 2023.03.0) </br>
      GitHub - umożliwia przechowywanie, śledzenia zmian oraz współpracę nad projektem

 Biblioteki zaimplementowane w R </br>
| Nazwa biblioteki | Wersja biblioteki | Opis | 
|------|------|------|
| *readr* | 2.1.4 | posłuży do wgrywania dokumentów w formacie csv |
| *shiny* | 1.7.5 | posłuży do stworzenia aplikacji WEB |
| *ggplot2* | 3.4.3 | posłuży do tworzenia wyższej jakości wizualizacji |
| *combinat* | 0.0-8 | umożliwia zastosowanie funkcji związanych z kombinatoryką |
| *gritExtra* | 2.3 | umożliwia elastyczne łączenie wielu wykresów lub tabel w jednym oknie graficznym |
| *nortest* | 1.0-4 | umożliwia przeprowadzenie testów na normalność rozkładów dwóch zmiennych |
| *lmtest* | 0.9-40 | umożliwia testowanie modeli regresji liniowej |

      
  **Architektura uruchomieniowa - stos technologiczny** </br>
     - R Script lub R Markdown 
     - biblioteki R (wyżej wymienione)

# 5. Testy
  **Scenariusze testów**
| Id testu | Opis | 
|------|------|
| T0 | Uruchomienie aplikacji poprzez wywołanie kodu |
| T1a | Wgranie dowolnego pliku CSV z wartościami liczbowymi |  
| T1b | Wgranie dowolnego pliku CSV z wartościami liczbowymi i kategorycznymi |
| T2 | Możliwość wyboru dowolnej zmiennej liczbowej jako zmienna zależna |
| T3 | Aplikacja reaguje na zmiany filtrów po kliknięciu "Uruchom model" |
| T4 | Po każdej aktualizacji modelu aplikacja zmienia wartości w tekście w zakładce "Podsumowanie modelu", zawsze gdy jest to stosowne (istnieje możliwość, że dla nowych filtrów najlepszy model pozostaje ten sam) |
| T5 | Dla modelu ze zmiennymi niezależnymi numerycznymi aplikacja dokonuje predykcji po odpowiednim wprowadzeniu wartości wg zaproponowanego formatu |
| T6 | Dla zbyt restrykcyjnych filtrów aplikacja wyświetla komunikat, że stworzenie modelu jest niemożliwe i sugeruje wybór innych, przy czym nie trzeba uruchamiać aplikacji na nowo |
 
  **Sprawozdanie z wykonania scenariuszy testów**
  | Id testu | Wynik | 
|------|------|
| T0 | SUKCES |
| T1a | SUKCES | 
| T1b | SUKCES |
| T2 | SUKCES |
| T3 | SUKCES |
| T4 | SUKCES |
| T5 | SUKCES |
| T6 | SUKCES |



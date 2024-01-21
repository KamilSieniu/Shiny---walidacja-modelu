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
| P1 | plik wsadowy     |    plik musi być w formacie csv  |  1-wymagane    |   funkcjonalne   |
| D1     |  dane wsadowe    |   dane nie mogą zawierać braków    |     1  |      |
|  D2    |  nazwa:    |dane powinny mieć odpowiednie klasy      | 2 - zalecane |
| **A** | **Załadowanie pliku z danymi** | | |
| A1 | Odpowiedni format pliku | Plik powinien być w formacie CSV | Wymagane | Funkcjonalne |
| A2 | Odpowiednia struktura danych | Separatorem kolumn musi być przecinek, a części dziesiętne powinny być rozdzielone kropką | Wymagane | Funkconalne |
| A3 | Postępowanie z brakami danych | Dane nie powinny zawierać braków. Jeśli jednak wystąpią, algorytm zinterpretuje je jako oddzielną kategorię zmiennej | Przydatne | Funkcjonalne |
| A4 | Odpowiednia struktura nagłówków kolumn | Nazwy nagłówków nie powinny zawierać spacji | Wymagana | Funkcjonalne |


     


   

# 4. Architektura systemu/oprogramowania </br>
  **Architektura rozwoju - stos technologiczny** </br>
      R (wersja 4.2.1), </br>
      R Studio (dodać wersje) </br>
  **Architektura uruchomieniowa - stos technologiczny** </br>
    Biblioteki zaimplementowane w R </br>
    *readr* (wersja 2.1.4) - posłuży do wgrywania dokumentów w formacie csv </br>
    *shiny* (wersja 1.7.5) - posłuży do stworzenia aplikacji WEB </br>
    *ggplot2* (wersja 3.4.3) - posłuży do tworzenia wyższej jakości wizualizacji </br>
    *combinat* (wersja 0.0-8) - umożliwia zastosowanie funkcji związanych z kombinatoryką </br>
    *gritExtra* (wersja 2.3) - umożliwia elastyczne łączenie wielu wykresów lub tabel w jednym oknie graficznym </br>
    *nortest* (wersja 1.0-4) - umożliwia przeprowadzenie testów na normalność rozkładów dwóch zmiennych </br>
    *lmtest* (wersja 0.9-40) - umożliwia testowanie modeli regresji liniowej </br>


!!! ALTERNATYWNIE !!!
| Nazwa biblioteki | Wersja biblioteki | Opis | 
|------|------|------|
| *readr* | 2.1.4 | posłuży do wgrywania dokumentów w formacie csv |
| *shiny* | 1.7.5 | posłuży do stworzenia aplikacji WEB |
| *ggplot2* | 3.4.3 | posłuży do tworzenia wyższej jakości wizualizacji |
| *combinat* | 0.0-8 | umożliwia zastosowanie funkcji związanych z kombinatoryką |
| *gritExtra* | 2.3 | umożliwia elastyczne łączenie wielu wykresów lub tabel w jednym oknie graficznym |
| *nortest* | 1.0-4 | umożliwia przeprowadzenie testów na normalność rozkładów dwóch zmiennych |
| *lmtest* | 0.9-40 | umożliwia testowanie modeli regresji liniowej |

# 5. Testy
  **Scenariusze testów**
    * wgranie dowolnego pliku CSV

| Id testu | Nazwa | Opis | 
|------|------|------|
| T1 | Wgranie dowolnego pliku  CSV | - |

    
  **Sprawozdanie z wykonania scenariuszy testów**
  | Id testu | Nazwa | Wynik | 
|------|------|------|
| T1 | Wgranie dowolnego pliku  CSV | - |

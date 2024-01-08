# 1. Charakterystyka oprogramowania </br>
  a. Nazwa skrócona - Walidator modelu </br>
  b. Nazwa pełna - Aplikacja służąca do uproszczonej walidacji odpowiedniego modelu liniowego dla dowolonych danych </br>
  c. Opis

# 2. Prawa autorskie </br>
  a. Autorzy </br>
  b. Licencje

# 3. Specyfikacja wymagań
  a. </br>
  | Col1 | Col2 | Col3 | Col4 | Col5 |
|------|------|------|------|------|
|  P1     | nazwa: plik wsadowy     |    opis: plik musi być w formacie csv  |  1-wymagane    |   funkcjonalne </br>   |
| D1     |  nazwa: dane wsadowe    |   opis: dane nie mogą zawierać braków    |     1  |      |
|  D2    |  nazwa:    |dane powinny mieć odpowiednie klasy      | 2 - zalecane 
     


   

# 4. Architektura systemu/oprogramowania </br>
  a. Architektura rozwoju - stos technologiczny </br>
      R (wersja 4.2.1), </br>
      R Studio (dodać wersje) </br>
  b. Architektura uruchomieniowa - stos technologiczny </br>
    Biblioteki zaimplementowane w R
    * readr (wersja 2.1.4) - posłuży do wgrywania dokumentów w formacie csv
    * shiny (wersja 1.7.5) - posłuży do stworzenia aplikacji WEB
    * ggplot2 (wersja 3.4.3) - posłuży do tworzenia wyższej jakości wizualizacji
    * combinat (wersja 0.0-8) - umożliwia zastosowanie funkcji związanych z kombinatoryką
    * gritExtra (wersja 2.3) - umożliwia elastyczne łączenie wielu wykresów lub tabel w jednym oknie graficznym
    * nortest (wersja 1.0-4) - umożliwia przeprowadzenie testów na normalność rozkładów dwóch zmiennych
    * lmtest (wersja 0.9-40) - umożliwia testowanie modeli regresji liniowej

# 5. Testy
  a. Scenariusze testów
    * wgranie dowolnego pliku cvs
    
  b. Sprawozdanie z wykonania scenariuszy testów

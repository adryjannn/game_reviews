# Temat: Aplikacja do recenzji gier 

## Technologies

Project is created with:

-   C#
-   entity framework
-   WPF
-   MVVM

# Wizualnie
### Okno logowania/rejestracji
-    Pola do wprowadzania danych - przycisk "login"
-   Dane logowania w bazie danych.
-   Komunikat o niepoprawnym haśle lub nazwie użytkownika

## Okno menu

- ekran powitany
- możliwość wylogowania się 
- nawigacja po lewej stronie

## Okno z listą gier

 - Wyświetlanie listy gier z bazy danych
 
## Okno do wyszukiwania recenzji
- Lista rozwijalna z dostępnymi grami
- Po wyborze gry wyświetlają się komentarze oraz oceny wszystkich użytkowników  


## Okno dodawania recenzji

- Wybór gry
- Miejsce na komentarz ( przyjmuje również null)
- Ocena 1-10
- Przycisk dodawania recenzji

## Okno z recenzjami użytkownika

- Pobiera z bazy wszystkie recenzje które wstawił użytkownik
- Przycisk "Modify" przy każdej z nich umożliwiający edycje 


# Baza danych

## Tabele
- Users
- Categories. 
- Producers
- Games
- Reviews

### ORM - operacje na bazie

   - Dodawanie rekordów w bazie
    - Pobieranie rekordów z bazy
    - Aktualizacja rekordów z bazy

# Instalacja projektu


## Wymagane oprogramowanie
- Visual Studio 2019/2022
- Ms SQL Server

## Instalacja

- Importujemy plik script(1).sql w Ms SQL Server
- Po sklonowaniu repozytorium wchodzimy do katalogu instalatora : game_reviews/Setup1/Release
- Uruchamiamy plik setup.exe
- Po zakończonej instalacji wchodzimy do katalogu z zainstalowaną aplikacją i uruchamiamy plik game_reviews.exe.config
- W tagu "ConnectionStrings" zmieniamy właściwość "data source=DESKTOP-O4L8475" na "data source=*Nazwa twojego serwera, na który importowałeś bazę danych*"
- Zapisujemy plik game_reviews.exe.config
- Urchamaiamy plik game_reviews.exe



Autorzy: Adrian Bugaj, Tomasz Chmielarczyk

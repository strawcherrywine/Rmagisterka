# paczki

library(tidyverse)

#wczytywanie danych
data <- iris
#nowa kolumna, podziel sepal length przez sepal width, kolumna sie nazywa iloraz
data$iloraz <- data$Sepal.Length / data$Sepal.Width
 #Tworzenie i operacje na istniejących kolumnach: mutate
#iloraz_2
data <- data |> 
  #Funkcja mutate, składnia podobna do rename-operacje na kolumnach 
  dplyr::mutate(iloraz_2=Sepal.Length / Sepal.Width)

#Operacja na istniejącej kolumnie
#logarytm naturalny z Petal.Length
data <- data |> 
  #log z P.L / operacja na istniejącej kolumnie
  dplyr::mutate(Petal.Length = log(Petal.Length))
 #dodaj stałą do kolumny
data <- data |> 
  #dodaj 1 
  dplyr::mutate(Petal.Length = Petal.Length + 1)
# Dodaj kolumnę: Sepal.Length-Petal.Length i policz pierwiastek z Sepal.Width
data <- data |> 
  dplyr::mutate(roznica = Sepal.Length - Petal.Length, Sepal.Width = sqrt(Sepal.Width))

#Policz logarytm z czterech pierwszych kolumn
data <- data |>
  dplyr::mutate(dplyr::across(dplyr::ends_with('th'), \(a) log10(a)))
#wczytaj dane jeszcze raz
data_2 <- iris

#operacja na wszystkich kolumnach-kolumny muszą spełniać jakiś warunek
data_2 <- data_2 |> 
dplyr::mutate(dplyr::across(dplyr::where(\(x) is.numeric(x)), \(a) a^2))  

#wczytaj dane
data_3 <- iris
 
#Zlogarytmuj te kolumny gdzie minimum jest większe od 1

data_3 <- data_3 |> 
  dplyr::mutate(dplyr::across(dplyr::where(\(y) is.numeric(y) && min(y) > 1), \(z) log2(z)))

#Wykonaj operację i zmień lokację
data_4 <- data_3 |> 
  dplyr::mutate(kolumna_1 = Petal.Length + 1, .before = Petal.Length)

#Wykonaj operację i przerzuć kolumny
data_5 <- data_3 |> 
  dplyr::mutate(kolumna = Petal.Length - 500, .keep = "none")

#Zmiena pozycji kolumny bez mutate
data_6 <- data_3 |> 
  dplyr::relocate(Petal.Length, .after = Sepal.Length)

#Wczytanie danych jeszcze raz
data_7 <- iris
# Tidyr - zmiana formatu ramki (np. jest format szeroki i długi)
#najpierw nadajemy unikalny identyfikator
data_7 <- data_7 |> 
  dplyr::mutate(id = 1:length(Sepal.Length))
#zmiana formatu
data_long <- data_7 |> 
  tidyr::pivot_wider(id_cols = id, names_from = Species, values_from = Sepal.Length:Petal.Width)
view(data_long)

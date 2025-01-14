#14.01.2025
#paczki
library(tidyverse)

data <- iris

#zła nazwa
data$'nazwa niezgodna ze skladnia' <- 1

#zmiana nazw kolumn z rename, to co po lewej to nowa rzecz, po prawej-stara nazwa
data <- dplyr::rename(data, sepal_length=Sepal.Length)

#Zmiana kilku kolumn z funkcją
data <- dplyr::rename_with(data, .cols = everything(),\(i) tolower (i))
funkcja_oli <-  function(argument1, argument2) {
  argument1+argument2
}

#użycie funkcji
funkcja_oli(argument=1, argument=2)
#zmiana na duże litery
#zmiana kilku kolumn z funkcją
data <- dplyr::rename_with(.data=data, .cols = dplyr::everything(), \(nazwy) toupper(nazwy))

#doklejenie fragmentu tekstu
znaki <- c("japco", "pomarancze", "mango")

znaki_2 <- paste(znaki, " lubie")
znaki_2

data <- dplyr::rename_with(data, .cols = dplyr::starts_with("sepal"), \(nazwy) paste(nazwy, ".ug"))

#summary
summary(data)
#print data
data

#struktura i typ
str(data)

#grupowanie danych
data_grupowane <- dplyr::group_by(data, SPECIES)

str(data_grupowane)

#policzenie podsumowania-srednia
data_srednie <- dplyr::summarise(
data_grupowane,
  dplyr::across(dplyr::ends_with("ug"), \(kolumna) mean(kolumna
)))
#policzenie podsumowania- median i min
data_srednie <- dplyr::summarise(
  data,
 mediana=dplyr::across(
   PETAL.LENGTH:PETAL.WIDTH, \(kolumna) median(kolumna)),
 minimum=dplyr::across(
   PETAL.LENGTH:PETAL.WIDTH, \(kolumna) min(kolumna)),
 .by=SPECIES)
#data <- działanie 1
#data <- działanie 2
#data <- działanie 3
wektor_liczbowy <- c(1,2,3,4,5)

wektor_liczbowy <- mean(wektor_liczbowy)

wektor_liczbowy_2 <- mean(c(1,2,3,4,5))
#ctrl shift m |
wektor_liczbowy_3 <- c(1,2,3,4,5) |>
  #liczenie sredniej
  mean() |> 
  #liczenie pierwiastka
  sqrt()
#sqrt(mean(c(1,2,3,4,5)))
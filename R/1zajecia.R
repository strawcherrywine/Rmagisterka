# komentarz zaczyna się od płotka
2+2
# tworzymy obiekty orzed przypisanie wartości do obiektu w sposób: nazwa_obiektu <- wartość
moje_działanie <- 2+2
moje_działanie
#syntaktyczne-podlegające zasadom danego języka
#w R nie zaczynamy od kropki, liczby, polskich i innych znaków, spacji
#alt i minus dają strzałkę a ctrl enter wywołuje akcję
#wektor i wymiar 2 elementy
wektor_1 <- c(1,2)

wektor_1

wektor_2 <- 1;10
wektor_2
# wektor 1 wynik, ale dziwne liczby
wektor_3 <- seq(3, 4, 0.12)
wektor_4 <- seq(9,-300,-2) 
# wektor 2 wymiary, to co w nawiasach jest czytane jako znak
ramka_1 <- data.frame(x=1:2,y=c("1","B"), z = TRUE)
ramka_1 <- data.frame(x=1:2, y=c("A", "B"), z = TRUE)
str(ramka_1) #pokazuje bardziej szczegółową strukturę

# wektor sklejony z różnych danych: jeżeli mieszamy dane, to R zmienia typ na jakiś wg hierarchii, np tutaj tekst
wektor_5 <- c(1,"C", TRUE)
#ramka składa się z kilku jednowymiarowych wektorów, mogą być różne typy danych 
#tworzenie listy
lista_1 <- list(integ = 1:2, kod_pocztowy = "80-308", prawda = FALSE)
lista_2 <- list(1:2, "80-308", FALSE)

# duży wektor
wektor_6 <- 1:6
wektor_7 <- c(9.26, 7.57363)

wektor_8 <- c(wektor_6, wektor_7)

# indeksowanie, można wyciągnąć daną za pomocą nawiasu kwadratowego
wektor_8[2]

wektor_9 <- wektor_1[2]
wektor_9

wektor_8[c("A", 5)]

wektor_8[c(3,5)]

wektor_5[wektor_5 == "1"]

# indeksowanie ramki, przed przecinkiem indeksowane-wiersze, po przecinku-kolumny
ramka_1[1, ] #wybierz 1 wiersz i wszystkie kolumny
#dolar wybiera kolumnę
ramka_1$y
ramka_1$y[1] #tutaj wybieramy kolumnę a później element wektora

lista_1[1]
lista_1[[1]]
lista_1$integ

# pierwsza średnia
srednia_1 <- mean(c(1,2,5,6))
srednia_1

srednia_2 <- mean(c(1, 2, NA , 6))
#usuwam wartości NA czyli puste
srednia_3 <- mean(c(1, 2, NA , 6), na.rm = TRUE)

mediana_1 <- median(c(1,2,NA,6), na.rm = TRUE)

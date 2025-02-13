#załadowanie paczek (dla plików excelowskich readxl)
library(tidyverse)
library (readxl)
 # Wczytanie danych
data <- iris

# Dodaj iris# Dodaj id
data <- data |> 
  mutate(id = 1:dplyr::n())
# Zmień nazwy na małe
data <- dplyr::rename_with(.data = data, .cols = everything(), \(a) tolower(a))

# Pivotowanie ####
# Długi format 
data_long <- data |> 
  tidyr::pivot_longer(-c(id, species), names_to = "nazwy", values_to = "wartosc")

#Szeroki format 
data_wide <- data_long |> 
  tidyr::pivot_wider(names_from = nazwy, values_from = wartosc)

# Po co to? Szybki ggplot2
# Kolorowanie według kolumny 
data |> ggplot2::ggplot(aes(id, petal.length, colour = species)) +
  geom_line() +
  facet_wrap(vars(species), scales = "free")

# Puste warosći #### 
# Dodaj wartość NA w 49 i 68 wierszu, w 3 kolumnie, zapisz nową ramkę danych 
data_na <- data
data_na[c(49,68), 3] <- NA
# Porzuć wiersze z wartościami NA
data_na <- data_na |> 
tidyr::drop_na()

#joins - operacje na ramkach ####
# Wylistowanie dostępnych arkuszy w pliku excel
readxl::excel_sheets("data/data_msu.xlsx")

data_1 <-  readxl::read_excel("data/data_msu.xlsx", sheet = "loi")

data_2 <-  readxl::read_excel("data/data_msu.xlsx", sheet = "elemental")

data_3 <- readxl::read_excel("data/data_msu.xlsx", sheet = "bsi")

# Łączenie ramek (mutating join)
# Left join 
data4 <- left_join(data_1, data_2)

data5 <- left_join(data_1, data_3)

data6 <- left_join(data_1, data_3, by = join_by(sample.id))

data7 <- left_join(data_1, data_3, by = join_by(sample.id == sample.id))
# Łączenie do prawej ramki 
data8 <- right_join(data_2, data_3)

# Łączenie wszystkiego - full
data9 <- full_join(data_3, data_1, by = join_by(sample.id))
# Łączenie z porzuceniem rzeczy bez pary
data10 <- inner_join(data_1, data_2)
#semi join
data11 <- semi_join(data_1, data_3, by = join_by(sample.id))
 
#anti join
data12 <- anti_join(data_1, data_2, by = join_by(sample.id))

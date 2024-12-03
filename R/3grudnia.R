dane_internet <- readr::read_csv("https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")
#dane z dysku-ścieżka bezwzględna
dane_dysk_01 <- readr::read_csv("D:/GitHub/Rmagisterka/R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")
#dane z dysku- ścieżka względna
dane_dysk_02 <- readr::read_csv("R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# zmiana kolumny tekst na liczbe
dane_dysk_02$Value <- as.numeric(dane_dysk_02$Value)

#parsowanie tekstu na liczbę
dane_dysk_01$Value <- readr::parse_number(dane_dysk_01$Value)

#sprawdzenie wiersza 748 INDEKSUJEMY PRZEZ NAWIASY KWADRATOWE
dane_internet[748, "Value"]
dane_internet[748, 2] <- "koń"


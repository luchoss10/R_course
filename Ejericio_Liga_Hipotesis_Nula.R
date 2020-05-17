liga <- read.csv("https://www.football-data.co.uk/mmz4281/1920/E0.csvv")
head(liga)
#my_data %>% filter(Sepal.Length > 7)
equipo<- liga[liga$HomeTeam == "Arsenal",]

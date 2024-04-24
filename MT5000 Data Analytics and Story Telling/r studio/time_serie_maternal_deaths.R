install.packages("plotly")
install.packages("tidyverse")

library(tidyverse)
library(plotly)
library(ggplot2)

localisation <- read_delim("localisation.csv", 
                           delim = ";", escape_double = FALSE, trim_ws = TRUE)

md_region_2020 <- read_delim("md_region_2020.csv", 
                             delim = ";", escape_double = FALSE, trim_ws = TRUE)


data_2020 <- md_region_2020%>% full_join(localisation, by = c("region"="country"))


colnames(data_2020)[1] <- "country"

data_2020$country <- as.character(data_2020$country)
data_2020$country[data_2020$country == "USA"] <- "United States of America"
data_2020$country[data_2020$country == "UK"] <- "United Kingdom"
data_2020$country[data_2020$country == "Republic of Congo"] <- "Republic of the Congo"
data_2020$country[data_2020$country == "Democratic Republic of the Congo"] <- "Congo"

ggplot(data_2020) +
  aes(Region, maternal_deaths_estimated, color=Region) +
  geom_line()+
  theme(plot.title = element_text(size = rel(1)),
        strip.text = element_text(face="bold", size=9,lineheight=5.0), #title by column
        axis.text.x = element_blank()) #remove x-axis legend here

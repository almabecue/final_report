install.packages("ggplot2")
install.packages("tidyverse")

library(ggplot2)
library(tidyverse)

Maternal_death_regions_2020 <- read_delim("~/MT5000 Data Analytics and Story Telling/Exam data/Maternal death regions 2020.csv", 
                                          delim = ";", escape_double = FALSE, col_types = cols(regions = col_character(), 
                                                                                               maternal_death_estimated = col_number(), 
                                                                                               year = col_date(format = "%Y")), 
                                          trim_ws = TRUE)
View(Maternal_death_regions_2020)

times_series_plot_1 <-Maternal_death_regions_2020 %>%
  ggplot() +
  aes(regions, maternal_death_estimated, group=regions, color=regions)+
  geom_line()
view(times_series_plot_1)

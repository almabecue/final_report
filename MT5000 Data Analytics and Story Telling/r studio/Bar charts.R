library(tidyverse)
library(plotly)
library(ggplot2)
library(viridisLite)

Nigeria <- read_delim("Nigeria.csv", delim = ";", 
                      escape_double = FALSE, trim_ws = TRUE)


barplot(Nigeria$pourcentage_women_gave_birth_before_18,Nigeria$year,
        names.arg=c("2003","2008","2011","2013","2017","2018"), 
        ylab = "% women who gave birth before 18 years old", 
        col=Nigeria$pourcentage_women_gave_birth_before_18)

barplot(Nigeria$Percentage_deliveries_skilled_health_personnel,Nigeria$year,
        names.arg=c("2003","2008","2011","2013","2017","2018"), 
        ylab = "% deliveries by skilled health personel", 
        col=Nigeria$Percentage_deliveries_skilled_health_personnel)

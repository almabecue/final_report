install.packages("plotly")
install.packages("tidyverse")

library(tidyverse)
library(plotly)
library(ggplot2)
library(viridisLite)

unicef_indicator_2 <- read_delim("unicef_indicator_2.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
unicef_indicator_1 <- read_delim("unicef_indicator_1.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)

Law_data <- full_join(unicef_indicator_1,unicef_indicator_2)
view(Law_data)

plot(Law_data$maternal_deaths_estimated,Law_data$legal_frameworks_pourcentage,
     main= "Estimated number of deaths on pourcentage of legal frameworkds present", 
     xlab= "% Maternal deaths", ylab = "% of legal frameworks present")

abline(lm(Law_data$legal_frameworks_pourcentage~Law_data$maternal_deaths_estimated),
       col= "violet")

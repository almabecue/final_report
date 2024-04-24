install.packages("ggplot2")
install.packages("tidyverse")

library(ggplot2)
library(tidyverse)

unicef_indicator_2 <- read_delim("unicef_indicator_2.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)

mapdata <- map_data("world") ##ggplot2

mapdata <- full_join(mapdata,unicef_indicator_2)

mapdatal<-mapdata%>% filter(!is.na(mapdata$maternal_deaths_estimated))

map1<-ggplot(mapdatal,aes(x=long, y=lat, group=group))+ geom_polygon(aes(fill=maternal_deaths_estimated), color="black")
map1

map2 <- map1 + scale_fill_gradient(name = "% maternal_deaths_estimated", low = "green", high =  "red", na.value = "grey50")+
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.y=element_blank(),
        axis.title.x=element_blank(),
        rect = element_blank())
map2

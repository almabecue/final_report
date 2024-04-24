install.packages("tidyverse")
install.packages("gapminder")

library(tidyverse)
library(gapminder)
data("gapminder")

ggplot(gapminder) +
  aes(gdpPercap,lifeExp,color = continent) +
  geom_boxplot()


ggplot(gapminder) +
  aes(x = year, y = pop, fill = continent)+
geom_col()

ggplot(gapminder) +
  aes(x = year, y = lifeExp, color = continent) +
  geom_point(alpha = 0.2, size = 1) +
  geom_smooth(method = "lm") +
  facet_wrap(~ continent, nrow = 1) +
  scale_x_continuous(breaks = c(1960, 1980, 2000)) +
  labs(
    x = "Year (from 1952 to 2007)",
    y = "Life Expectancy",
    title = "Evolution of life expectancy from 1952 to 2007 per continent."
  ) +
  theme_classic() +
  theme(text = element_text(size = 20)) +
  guides(color ="none")

install.packages("maps")

pop_2007 <- gapminder %>% 
  filter(year == 2007)

map_world <- map_data("world") 

map_pop_2007 <- full_join(map_world, pop_2007, by = c("region" = "country"))

ggplot(data = map_pop_2007) +
  aes(x = long, y = lat, group = group, fill = pop) +
  geom_polygon() +
  scale_fill_gradient(low = "yellow", high = "red", na.value = "grey") +
  labs(
    title = "Differences between countries regarding their population in 2007",
    subtitle = "Countries in grey have no data due to a mismatch with their names",
    caption = "Source: R package {gapminder}",
    x = "Longitude",
    y = "Latitude",
    fill = "Country Population"
  ) +
  theme_bw()




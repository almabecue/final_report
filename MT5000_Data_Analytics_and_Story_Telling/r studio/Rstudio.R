install.packages("tidyverse")
install.packages("gapminder")

library(tidyverse)
library(gapminder)
data("gapminder")

head(gapminder)
filter(gapminder,country=="Ireland")
gapminder_ireland <- filter(gapminder, country == "Ireland")
gapminder_ireland_2007 <- filter(gapminder_ireland, year == 2007)

filter(gapminder,country=="France")
gapminder_france <- filter(gapminder, country == "France")
gapminder_france_1982<- filter(gapminder_france, year == 1982)

gapminder_keep <- select(gapminder, country, year, pop)
gapminder_remove <- select(gapminder, -continent, -lifeExp, -gdpPercap)
select(gapminder, country, population = pop, measure_year = year)

select(gapminder,life_expectancy=lifeExp,gdp_per_capita=gdpPercap)

new_data <- select(gapminder, -pop, -year)
new_data

mutate(gapminder, gdp_total = pop * gdpPercap)
mutate(gapminder,country_upper =toupper(country))

europe_2007 <- filter(gapminder, continent =="Europe", year == 2007)
mutate(europe_2007,europe_pop = pop/sum(pop))

summarise(gapminder, mean(pop))
summarise(gapminder, sd(pop))
summarise(gapminder, mean_pop = mean(pop))
summarise(gapminder, sd_pop = sd(pop))
summarise(gapminder, sum_pop = sum(pop), mean_pop = mean(pop), sd_pop = sd(pop))
gapminder_by_year <- group_by(gapminder, year)
summarise(gapminder_by_year, sum_pop = sum(pop))

gapminder_group <- group_by(gapminder,continent,year)
summarise(gapminder_group,meanpop = mean(pop))

summarise(gapminder_group,sdpop = sd(pop))

starwars %>%
  select(name, height, mass, homeworld) %>%
  mutate(height = height * 0.0328084) %>% # overwrite height values to feet
  group_by(homeworld) %>%
  filter(height == max(height))

gapminder%>%
  group_by(year)%>% 
  summarise(sum_pop=sum(pop))

gapminder%>%
  group_by(year,continent)%>% 
  summarise(mean(lifeExp))
            
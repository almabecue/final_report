library(ggplot2)
library(tidyverse)

Nigeria <- read.csv("~/MT5000 Data Analytics and Story Telling/Exam data/Nigeria.csv", sep=";")
view (Nigeria)

attach(Nigeria)
dim(Nigeria)
names(Nigeria)"Country" "year" "Women (aged 20-24 years) who gave birth before age 18 %" "Deliveries attended by skilled health personnel %"

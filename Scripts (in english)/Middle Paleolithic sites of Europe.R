#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

load("Maps/Europe continent Transition and UP.RData")

Europe.MP <- readODS::read_ods("Datasets/European-Transitional-Industries.ods",
                               sheet = 2)

ggmap(Europe.Map2) +
  theme_map() +
  geom_point(data = Europe.MP,
             aes(longitude, latitude), 
             size =  5, alpha = 1, shape = 23, fill = "red", color = "black") +
  
  geom_label(aes(x = 18.1, y = 59,
                 label = "Middle Paleolithic sites of Europe (300 - 42 Ka)"),
             color = "black", fill = "white", size = 7, fontface = "bold" ) +
  
  geom_label(aes(x = 4, y = 58,
                 label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2.5) 

ggsave(
  "Images-english/Middle Paleolithic sites of Europe.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 16,
  units = "cm"
)
#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra)

load("Maps/Eurasian continent.RData")

#### Puntos de los eventos de hibridación ####
Location.Data <- tibble(
  Place = c("Near East", "East Europe", "Central Asia"),
  longitude = c(32.507696030189535, 44.606039016775384, 51.73062523940355),
  latitude = c(35.184168168468545, 22.630261500979486, 59.34259696965284))

#### Mapa de eventos de hibridación ####
ggmap(Eurasian.Cont) +
  theme_map() +
  geom_point(data = Location.Data, aes(latitude, longitude),
             shape = 21, size = 20, alpha = 0.8, fill = "purple") +
  ggrepel::geom_label_repel(data = Location.Data, 
                            aes(latitude, longitude, label = Place), 
                            label.size = 0.01,
                            force_pull = -1.25,
                            size = 3,
                            xlim = c(-12, 135), ylim = c(21, 65),
                            box.padding = unit(0.01, "lines"),
                            nudge_y = 0.8) +
  theme(
    legend.position = "none")


ggsave(
  "Images-english/Hibridation Neanderthals.jpg",
  device = "jpg",
  dpi = 1200,
  width = 15,
  height = 7.25,
  units = "cm"
)
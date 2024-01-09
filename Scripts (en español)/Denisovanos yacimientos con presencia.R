#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Load data ####
load("Maps/Asia map.RData")

Denisov.Sites <- data.frame(
  Site = c("Denisova", "Baishiya", "Cobra Cave"),
  longitude = c(84.68, 102.95, 103.41),
  latitude = c(51.40, 35.75, 20.21)
)

#### Mapa de yacimientos con Denisovanos ####
ggmap(Cent.Asia) +
  theme_map() +
  geom_point(data = Denisov.Sites,
             aes(longitude, latitude), 
             size =  5, alpha = 1, shape = 23, fill = "red", color = "black") +
  
  geom_label(aes(x = 59, y = 55,
                 label = "Yacimientos con restos de Denisovanos"),
             color = "black", fill = "white", size = 6, fontface = "bold" ) +
  
  geom_label(aes(x = 37, y = 6,
                 label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2.5) +

  ggrepel::geom_label_repel(data = Denisov.Sites, 
                            aes(longitude, latitude, label = Site),
                            alpha = 1,
                            color = "black",
                            label.size = 0.01,
                            force_pull = -1,
                            size = 6,
                            xlim = c(25, 150), ylim = c(5, 53),
                            box.padding = unit(0.01, "lines"),
                            show.legend = FALSE) 
  
ggsave(
  "Images-español/Denisovanos yacimientos con restos.jpg",
  device = "jpg",
  dpi = 1200,
  width = 22,
  height = 12,
  units = "cm"
)
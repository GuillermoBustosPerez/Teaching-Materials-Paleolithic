#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes)

#### Cargar mapas y base de datos #####
load("Maps/WEurope for Solutrean.RData")
load("Datasets/Solutrean WEurope.RData")

#### Mapa del teórico origen del Solutrense ####
ggmap(WEurope2) +
  theme_map() +
  
  geom_point(data = Solutrean.WE,
             aes(longitude, latitude, fill = Facies), 
             size =  4, shape = 23, color = "black") +
  ggsci::scale_fill_aaas(
    name = "Solutrense",
    labels = c("Origen teórico", "Expansión")) +
  
  geom_label(aes(x = -3.75, y = 49.85, label = "Origen y expansión del Solutrense"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
  
  geom_label(aes(x = -5.5, y = 49.10, label = "Datos: Maier, A., Zimmermann, A. (2015).\nCRC806-E1 LGM-Sites Database V-20150313"),
             color = "black", fill = "white", size = 3, alpha = 0.5) +
  theme(
    legend.title = element_text(size = 13, face = "bold"),
    legend.text = element_text(size = 12),
    legend.position = c(0.77,0)
  )

ggsave(
  "Images-español/Solutrense Origen y expoansión.jpg",
  device = "jpg",
  dpi = 1200,
  width = 18,
  height = 17,
  units = "cm"
)

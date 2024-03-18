#### Load packages ####
library(tidyverse); library(maps); library(ggmap); library(ggthemes);
library(gridExtra); 

load(file = "Maps/South Iberian Peninsula.RData")
Gravet.Sites <- readODS::read_ods("Datasets/CRC806-Database Gravetian Sites.ods")
load("Datasets/Solutrean WEurope.RData")

# Densidad yacimientos gravetienses sur de la Península Ibérica
ggmap(S.Ib.Pen) +
  theme_map() +
  geom_point(data = Gravet.Sites,
             aes(longitude, latitude), 
             shape = 23, color = "black", size =  5, fill = "green") +
  stat_density2d(
    data =   Gravet.Sites, 
    aes(x = longitude, y = latitude,
        fill = after_stat(level)),
    geom = "polygon", bins = 3, alpha = 0.2) +
  scale_fill_gradient(low = "white", high = "green") +
  geom_label(aes(x = -1, y = 35.95, label = "Data from: Maier & Zimmerman, CRC806-E1 Gravettian-Sites Database V-20160219"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  geom_label(aes(x = -4.5, y = 39, label = "Densidad de yacimientos Gravetienses en el sur de la Península Ibérica"),
             color = "black", fill = "white", size = 4, alpha = 0.5, fontface = "bold") +
  theme(
    legend.position = "none")

ggsave(
  "Gravetiense en el sur de la Península Ibérica.jpg",
  path = "Images-español",
  device = "jpg",
  dpi = 1200,
  width = 27,
  height = 15,
  units = "cm"
)
  
# Densidad yacimientos gravetienses sur de la Península Ibérica
ggmap(S.Ib.Pen) +
  theme_map() +
  geom_point(data = Solutrean.WE,
             aes(longitude, latitude), 
             shape = 23, color = "black", size =  5, fill = "blue") +
  stat_density2d(
    data = Solutrean.WE, 
    aes(x = longitude, y = latitude,
        fill = after_stat(level)),
    geom = "polygon", bins = 3, alpha = 0.2) +
  scale_fill_gradient(low = "white", high = "blue") +
  geom_label(aes(x = -1.75, y = 35.95, label = "Datos: Maier, A., Zimmermann, A. (2015). CRC806-E1 LGM-Sites Database V-20150313"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  geom_label(aes(x = -4.5, y = 39, label = "Densidad de yacimientos Solutrensese en el sur de la Península Ibérica"),
             color = "black", fill = "white", size = 4, alpha = 0.5, fontface = "bold") +
  theme(
    legend.position = "none")

ggsave(
  "Solutrense en el sur de la Península Ibérica.jpg",
  path = "Images-español",
  device = "jpg",
  dpi = 1200,
  width = 27,
  height = 15,
  units = "cm"
)


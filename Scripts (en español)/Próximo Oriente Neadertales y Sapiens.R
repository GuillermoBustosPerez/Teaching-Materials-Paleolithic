#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Cargar y muglear los archivos ####
load("Maps/Near East.RData")
NE.Cross <- readODS::read_ods("Datasets/Sapiens-Neand-Denisovans.ods",
                              sheet = 2)

NE.Cross <- NE.Cross %>% 
  mutate(
    Remains = factor(Remains, level = c("Neanderthals", "Sapiens", "Both", "None"),
                     labels = c("Neandertales", "Sapiens", "Ambos", "Sin restos")))

#### Hacer el map ####
ggmap(N.East) +
  theme_map() +
  geom_point(data = NE.Cross,
             aes(longitude, latitude, fill = Remains), 
             size =  5, alpha = 0.75, shape = 23,color = "black") +
  ggsci::scale_fill_d3(name = "Restos") +
  labs(title = "Yacimientos en Próximo Oriente entre 130 - 45 Ka") +
  
  geom_label(aes(x = 47, y = 27.9,
                 label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2) +
  theme(
    plot.title = element_text(size = 13, color = "black", face = "bold", hjust = 0.5),
    legend.title = element_text(size = 12, color = "black", face = "bold", hjust = 0.5),
    legend.text = element_text(size = 11, color = "black")
  )

ggsave(
  "Images-español/Próximo Oriente Neandertales y sapiens.jpg",
  device = "jpg",
  dpi = 1200,
  width = 18,
  height = 12,
  units = "cm"
)


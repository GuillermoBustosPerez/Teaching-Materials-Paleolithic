#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Cargar mapa y datas correspondientes ####
load("Maps/Africa map.RData")
Early.Hsapiens <- readODS::read_ods("Datasets/Early-H-sapiens.ods")

#### Yacimientos con etiqueta ####
To.Label <-  Early.Hsapiens %>% 
  filter(
    Site == "Homo" | 
      Site == "Herto" |
      Site == "Bodo")

#### Plot the map ####
ggmap(Africa) +
  theme_map() +
  geom_hline(yintercept = 0, 
             alpha = 0.2, 
             linetype = "dashed", 
             linewidth = 1) +
  geom_point(data = Early.Hsapiens,
             aes(longitude, latitude), 
             size =  5, alpha = 1, shape = 23, fill = "blue", color = "black") +
  
  geom_label(aes(x = 17.75, y = 35,
                 label = "Sites with first presewnce of AMH\n~200 ka"),
             color = "black", fill = "white", size = 6, fontface = "bold") +
  
  ggrepel::geom_label_repel(data = To.Label, 
                            aes(longitude, latitude, label = Site), 
                            label.size = 0.01,
                            force_pull = -1.25,
                            size = 6,
                            xlim = c(-18, 53), ylim = c(-36, 37),
                            box.padding = unit(0.01, "lines"),
                            nudge_y = 0.8) +
  
  geom_label(aes(x = -5.22, y = -35, label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2.5, alpha = 0.5) 

ggsave(
  "Images-english/First presence of H sapiens.jpg",
  device = "jpg",
  dpi = 1200,
  width = 15,
  height = 18,
  units = "cm"
)

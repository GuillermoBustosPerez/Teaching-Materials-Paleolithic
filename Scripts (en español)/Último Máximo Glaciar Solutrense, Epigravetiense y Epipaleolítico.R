#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

load("Maps/Europe & Levant 2.RData")
LGM.Sites <- readODS::read_ods("Datasets/LGM-Europe-Levant.ods",
                           sheet = 1)

LGM.Sites <- LGM.Sites %>% 
  mutate(
    Complex = factor(Complex, 
                      levels = c("Solutrean", "Epigravettian", "Epipaleolithic"),
                      labels = c("Solutrense", "Epigravetiense", "Epipaleolítico")))

#### Mapa de solutrense, Epigravetiense y Epipaleolítico ####
ggmap(Europe.Levant2) +
  theme_map() +
  
  geom_point(data = LGM.Sites,
             aes(longitude, latitude, color = Complex, shape = Complex, fill = Complex), 
             size =  4, alpha = 1, color = "black") +
  scale_shape_manual(values = c(21:24),
                     name = "Complejo") +
  scale_fill_manual(name = "Complejo",
                    values = c("blue", "gold", "lightgoldenrod3")) +
  
  geom_label(aes(x = 15, y = 54, label = "Europa y el Levante durante el Último Máximo Glaciar"),
             color = "black", fill = "white", size = 6, alpha = 0.5, fontface = "bold") +
  
  geom_label(aes(x = 4.5, y = 28.5, label = "CRC806-E1 LGM-Sites Database V-20150313"),
             color = "black", fill = "white", size = 2.5, alpha = 0.5) +
  
  theme(
    legend.title = element_text(size = 13, face = "bold"),
    legend.text = element_text(size = 12)
  )
  
ggsave(
  "Images-español/LGM Solutrense, Epigravetiense y Epipaleolítico v1.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 16,
  units = "cm"
)

#### Segunda versión del mapa ####
ggmap(Europe.Levant2) +
  theme_map() +
  
  geom_point(data = LGM.Sites,
             aes(longitude, latitude, color = Complex, shape = Complex, fill = Complex), 
             size =  4, alpha = 1, color = "black") +
  scale_shape_manual(values = c(21:24),
                     name = "Complejo") +
  scale_fill_manual(name = "Complejo",
                    values = c("blue", "gold", "lightgoldenrod3")) +
  ggtext::geom_richtext(aes(x = -1.4, y = 44, label = "S o l u t r e n s e"), 
                        alpha = 0.75, angle = 45, fill = "blue", size = 5) +
  
  ggtext::geom_richtext(aes(x = 18.85, y = 44.4, label = "E p i g r a v e t i e n s e"), 
                        alpha = 0.75, angle = -40, fill = "gold", size = 5) +
  
  ggtext::geom_richtext(aes(x = 27, y = 31.5, label = "E p i p a l e o l í t i c o"),
                        alpha = 0.75, angle = 0, fill = "lightgoldenrod3", size = 5) +
  
  geom_label(aes(x = 15, y = 54, label = "Europa y el Levante mediterráneo durante el Último Máximo Glaciar"),
             color = "black", fill = "white", size = 5.35, alpha = 0.5, fontface = "bold") +
  
  geom_label(aes(x = 0, y = 53, label = "CRC806-E1 LGM-Sites Database V-20150313"),
             color = "black", fill = "white", size = 2.5, alpha = 0.5) +
  
  theme(
    legend.position = "none")


ggsave(
  "Images-español/LGM Solutrense, Epigravetiense y Epipaleolítico v2.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 16,
  units = "cm"
)
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

#### Mapa origen Ateriense del Solutrense v1 #####
load("Maps/Europe & North Africa.RData")

Aterian.Origin <- rbind(
  readODS::read_ods("Datasets/LGM-Europe-Levant.ods", sheet = 1),
  readODS::read_ods("Datasets/LGM-Europe-Levant.ods",sheet = 2))

Aterian.Origin <- Aterian.Origin %>% mutate(
  Complex = factor(Complex, 
                levels = c("Aterian", "Solutrean", 
                           "Epigravettian", "Epipaleolithic"),
                labels = c("Ateriense", "Solutrense",
                           "Epigravetiense", "Epipaleolítico"))) %>% 
  rename(Complejo = Complex)

# Generar mapa
ggmap(Europe.Africa) +
  theme_map() +
  geom_point(data = Aterian.Origin,
             aes(longitude, latitude, shape = Complejo, fill = Complejo,
                 size = Complejo, alpha = Complejo)) +
  scale_fill_manual(values = c("royalblue4", "blue", 
                               "darkolivegreen2", "khaki1")) +
  scale_alpha_manual(values = c(1, 1, 0.55, 0.55)) +
  scale_size_manual(values = c(4, 4, 2.5, 2.5)) +
  scale_shape_manual(values = c(23, 23, 22, 22)) +
  geom_label(aes(x = 15, y = 54, label = "Teoría del origen Ateriense del Solutrense"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
  ggtext::geom_richtext(aes(x = 15, y = 9.75, 
                            label = 
                              "CRC806-E1 LGM-Sites Database V-20150313 & ROAD Dataset"),
                        color = "black", fill = "white", size = 2.5, alpha = 0.5) +
  theme(
    legend.title = element_text(size = 13, face = "bold", color = "black"),
    legend.text = element_text(size = 12, color = "black"))

ggsave(
  "Images-español/Solutrense Origen. Teoría Ateriense v1.jpg",
  device = "jpg",
  dpi = 1200,
  width = 15,
  height = 18,
  units = "cm"
)

#### Mapa origen Ateriense del Solutrense v2 #####
ggmap(Europe.Africa) +
  theme_map() +
  geom_point(data = Aterian.Origin,
             aes(longitude, latitude, shape = Complejo, fill = Complejo,
                 size = Complejo, alpha = Complejo)) +

  stat_ellipse(data = Aterian.Origin %>% 
                 filter(Complejo == "Ateriense" | Complejo == "Solutrense"),
               aes(longitude, latitude, color = Complejo), level = 0.99) +
  
  scale_fill_manual(values = c("royalblue4", "blue", 
                               "darkolivegreen2", "gold")) +
  
  scale_color_manual(values = c("royalblue4", "blue", 
                               "darkolivegreen2", "gold")) +
  scale_alpha_manual(values = c(1, 1, 0.55, 0.55)) +
  scale_size_manual(values = c(4, 4, 2.5, 2.5)) +
  scale_shape_manual(values = c(23, 23, 22, 22)) +
  

  ggtext::geom_richtext(aes(x = 8, y = 30.55, label = "A t e r i e n s e"),
                        angle = -20, fill = "royalblue4", size = 5) +
  
  ggtext::geom_richtext(aes(x = -1.4, y = 44, label = "S o l u t r e n s e"), 
                        angle = 45, fill = "blue", size = 5) +
  
  ggtext::geom_richtext(aes(x = 18.85, y = 44.4, label = "E p i g r a v e t i e n s e"), 
                        angle = -40, fill = "darkolivegreen2", size = 2) +
  
  ggtext::geom_richtext(aes(x = 30.75, y = 34, label = "E p i p a l e o l í t i c o"),
                        angle = 0, fill = "gold", size = 2, alpha = 0.5) +
  
  geom_label(aes(x = 15, y = 54, label = "Teoría del origen Ateriense del Solutrense"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
  
  ggtext::geom_richtext(aes(x = 2, y = 10, 
                            label = 
                              "CRC806-E1 LGM-Sites Database V-20150313 & ROAD Dataset"),
                        color = "black", fill = "white", size = 2.5, alpha = 0.5) +
  
  theme(legend.position = "none")

ggsave(
  "Images-español/Solutrense Origen. Teoría Ateriense v2.jpg",
  device = "jpg",
  dpi = 1200,
  width = 15,
  height = 18,
  units = "cm"
)

#### Origen Szeletiense del Solutrense #####
load("Maps/Europe & Near East.RData")

Szeletian.Origin <- rbind(
  Aterian.Origin,
  readODS::read_ods("Datasets/European-Transitional-Industries.ods", sheet = 1) %>% 
    filter(Complex == "Szeletiense") %>% select(-c(type)) %>% 
    rename(site = locality,
           Complejo = Complex))
 
Szeletian.Origin <- Szeletian.Origin %>% filter(Complejo != "Ateriense") %>% 
  mutate(Complejo = factor(Complejo,
                           levels = c("Solutrense", "Szeletiense",
                                      "Epigravetiense", "Epipaleolítico")))

ggmap(Europe.NearEast) +
  theme_map() +
  geom_point(data = Szeletian.Origin,
             aes(longitude, latitude, shape = Complejo, fill = Complejo,
                 size = Complejo, alpha = Complejo)) +
  
  stat_ellipse(data = Szeletian.Origin %>% 
                 filter(Complejo == "Solutrense" | Complejo == "Szeletiense"),
               aes(longitude, latitude, color = Complejo), level = 0.99,
               show.legend = FALSE) +
  
  scale_fill_manual(values = c("blue", "red", 
                               "darkolivegreen2", "khaki1")) +
  scale_color_manual(values = c("blue", "red", 
                               "darkolivegreen2", "khaki1")) +
  
  scale_alpha_manual(values = c(1, 1, 0.55, 0.55)) +
  scale_size_manual(values = c(4, 4, 2.5, 2.5)) +
  scale_shape_manual(values = c(23, 23, 22, 22)) +
  geom_label(aes(x = 15, y = 54, label = "Teoría del origen Szeletiense del Solutrense"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
  ggtext::geom_richtext(aes(x = 18, y = 30.5, 
                            label = 
                              "CRC806-E1 LGM-Sites Database V-20150313 & ROAD Dataset"),
                        color = "black", fill = "white", size = 2.5, alpha = 0.5) +
  guides(fill = guide_legend(ncol = 2),
         color = guide_legend(ncol = 2),
         shape = guide_legend(ncol = 2)) +
  theme(
    legend.title = element_text(size = 13, face = "bold", color = "black"),
    legend.text = element_text(size = 12, color = "black"))

ggsave(
  "Images-español/Solutrense Origen. Teoría Szeletiense v1.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 15,
  units = "cm")
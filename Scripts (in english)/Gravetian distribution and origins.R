#### Load packages ####
library(tidyverse); library(maps); library(ggmap); library(ggthemes);

Grav.Sites <- readODS::read_ods("Datasets/CRC806-Database Gravetian Sites.ods")
load("Maps/Europe continent Transition and UP.RData")


#### General view of gravetian sites ####
ggmap(Europe.Map2) +
  theme_map() +
  
  geom_label(aes(x = 18.1, y = 58, label = "Gravetian sites 31 - 25 Ka"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
  geom_label(aes(x = -1, y = 35.2, label = "Maier & Zimmerman, CRC806-E1 Gravettian-Sites Database V-20160219"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  geom_point(data = Grav.Sites,
             aes(longitude, latitude), 
             size =  4, shape = 23, fill = "darkolivegreen2")

ggsave(
  "Gravetiense sites.jpg",
  path = "Images-english",
  device = "jpg",
  dpi = 1200,
  width = 21,
  height = 14,
  units = "cm"
)

#### Monocentric origin of the gravettian ####
Mono.Centr.Grav <- Grav.Sites %>% mutate(
  Centers = case_when(
    latitude > 47.75 & latitude < 53 &
      longitude > 15.585670277224336 & longitude < 20.1 ~ "Pavlovian",
    
    latitude > 47.5 & latitude < 49.2 &
      longitude > 4 & longitude < 15.585670277224336 ~ "Upper Danube",
    
    latitude > 49 & latitude < 54 &
      longitude > 4  & longitude < 10 ~ "Middle Rhine group",
    latitude > 46.5 & latitude < 49 &
      longitude > -10  & longitude < 6 ~ "Maisierian/Perigordian",
    latitude > 36 & latitude < 46.5 &
      longitude > -10  & longitude < 9 ~ "Western Gravettian (Perigordian)",
    
    latitude > 36 & latitude < 46.4 &
      longitude > 7  & longitude < 19.5 ~ "Mediterranean Gravettian",
    latitude > 36 & latitude< 44 &
      longitude > 19.5  & longitude < 29 ~ "Mediterranean Gravettian",
    
    latitude > 45.75 & latitude < 51 &
      longitude > 24  & longitude < 29 ~ "Dnester/Prut group (Molodovian)",
    TRUE ~ "Others"
  )) %>% 
  
  mutate(
    Centers = factor(Centers, 
                     levels = c(
                       "Pavlovian", 
                       "Dnester/Prut group (Molodovian)", 
                       "Upper Danube",
                       "Middle Rhine group",
                       "Maisierian/Perigordian",
                       "Western Gravettian (Perigordian)",
                       "Mediterranean Gravettian",
                       "Others")))

ggmap(Europe.Map2) +
  theme_map() +
  geom_point(data = Mono.Centr.Grav,
             aes(longitude, latitude, shape = Centers, fill = Centers, alpha = Centers, size =  Centers), 
             color  = "black") +
  scale_shape_manual(values = c(23, 24, 22, 22, 22, 22, 25, 21)) +
  scale_alpha_manual(values = c(1, 0.9, 0.9, 0.7, 0.5, 0.5, 0.5, 0.4)) +
  scale_size_manual(values = c(6,3,3,3,3,3,3,2)) +
  scale_fill_manual(values = c(
    "darkgreen",
    "olivedrab4", 
    "darkolivegreen3",
    "darkolivegreen4",
    "springgreen4",
    "springgreen3", 
    "olivedrab2",
    "black")) +
  stat_ellipse(
    data = Mono.Centr.Grav %>% filter(Centers == "Pavlovian"),
    aes(longitude, latitude, color = Centers), 
    show.legend = FALSE,
    level = 0.99995, linewidth = 1.5, linetype = 4) +
  
  scale_color_manual(values = c(
    "black")) +
  
  geom_label(aes(x = 5, y = 58, label = "Monocentric origin of the Gravettian\n31 - 25 Ka"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
  geom_label(aes(x = -1, y = 35.2, label = "Maier & Zimmerman, CRC806-E1 Gravettian-Sites Database V-20160219"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  
  theme(legend.position = c(0.69, 0.51),
        legend.title = element_text(face = "bold", size = 11),
        legend.text = element_text(size = 10))

ggsave(
  "Gravettian monocentric origin.jpg",
  path = "Images-english",
  device = "jpg",
  dpi = 1200,
  width = 21,
  height = 14,
  units = "cm"
)

#### Origen policéntrico del gravetiense ####
Poly.Centr.Grav <- Grav.Sites %>% mutate(
  Centers = case_when(
    latitude > 41.35 & latitude < 47 &
      longitude > -1.6  & longitude < 4.1 ~ "Western Gravettian (Perigordian)",
    latitude > 47.75 & latitude < 53 &
      longitude > 15.585670277224336 & longitude < 19 ~ "Middle Danube Gravettian",
    latitude > 45.75 & latitude < 51 &
      longitude > 24  & longitude < 29 ~ "Dnester/Prut group",
    
    latitude > 35 & latitude < 43 &
      longitude > 12  & longitude < 24 ~ "Mediterranean Gravettian",
    
    latitude > 44 & latitude < 46.5 &
      longitude > 32.2  & longitude < 36.7 ~ "Crimean Gravettian",
    
    latitude > 49 & latitude < 59 &
      longitude > 33  & longitude < 59 ~ "Middle Don Gravettian",
    TRUE ~ "Area of expansion")) %>% 
  
  mutate(
    Centers = factor(Centers, levels = c(
      "Western Gravettian (Perigordian)",
      "Middle Danube Gravettian",
      "Dnester/Prut group",
      "Mediterranean Gravettian",
      "Crimean Gravettian",
      "Middle Don Gravettian",
      "Area of expansion")))

ggmap(Europe.Map2) +
  theme_map() +
  geom_point(data = Poly.Centr.Grav,
             aes(longitude, latitude, shape = Centers, fill = Centers, alpha = Centers, size =  Centers), 
             color  = "black") +
  scale_shape_manual(values = c(22, 23, 24, 25, 22, 23, 21),
                     name = "Polycentric origin of the Gravettian 31 - 25 Ka") +
  scale_alpha_manual(values = c(1, 1, 1, 1, 1, 1, 0.65),
                     name = "Polycentric origin of the Gravettian 31 - 25 Ka") +
  scale_size_manual(values = c(5, 5, 5, 5, 5, 5, 3.75),
                    name = "Polycentric origin of the Gravettian 31 - 25 Ka") +
  scale_fill_manual(values = c(
    "darkgreen",
    "olivedrab4", 
    "darkolivegreen4",
    "springgreen4",
    "springgreen3", 
    "olivedrab2",
    "darkgray"),
    name = "Polycentric origin of the Gravettian 31 - 25 Ka") +
  
  guides(fill = guide_legend(nrow = 2),
         shape = guide_legend(nrow = 2)) +
  
  geom_label(aes(x = -1, y = 35.2, label = "Maier & Zimmerman, CRC806-E1 Gravettian-Sites Database V-20160219"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  
  theme(
    legend.position = c(0.01, 0.75),
    legend.title = element_text(face = "bold", size = 13, hjust = 0.5),
    legend.text = element_text(size = 9.5))

ggsave(
  "Gravettian polycentric origin.jpg",
  path = "Images-english",
  device = "jpg",
  dpi = 1200,
  width = 21,
  height = 14,
  units = "cm"
)

# Versión 2 del mapa
ggmap(Europe.Map2) +
  theme_map() +
  geom_point(data = Poly.Centr.Grav,
             aes(longitude, latitude, shape = Centers, fill = Centers, alpha = Centers, size =  Centers), 
             color  = "black") +
  scale_shape_manual(values = c(22, 23, 24, 25, 22, 23, 21),
                     name = "Polycentric\norigin of\nthe Gravettian\n31 - 25 Ka") +
  scale_alpha_manual(values = c(1, 1, 1, 1, 1, 1, 0.65),
                     name = "Polycentric\norigin of\nthe Gravettian\n31 - 25 Ka") +
  scale_size_manual(values = c(5, 5, 5, 5, 5, 5, 3.75),
                    name = "Polycentric\norigin of\nthe Gravettian\n31 - 25 Ka") +
  scale_fill_manual(values = c(
    "darkgreen",
    "olivedrab4", 
    "darkolivegreen4",
    "springgreen4",
    "springgreen3", 
    "olivedrab2",
    "darkgray"),
    name = "Polycentric\norigin of\nthe Gravettian\n31 - 25 Ka") +
  
  guides(fill = guide_legend(ncol = 1),
         shape = guide_legend(ncol = 1)) +
  
  geom_label(aes(x = -1, y = 35.2, label = "Maier & Zimmerman, CRC806-E1 Gravettian-Sites Database V-20160219"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  
  theme(
    legend.position = "right",
    legend.title = element_text(face = "bold", size = 13, hjust = 0),
    legend.text = element_text(size = 9.5))

ggsave(
  "Gravettian polycentric origin v2.jpg",
  path = "Images-english",
  device = "jpg",
  dpi = 1200,
  width = 27,
  height = 14,
  units = "cm"
)
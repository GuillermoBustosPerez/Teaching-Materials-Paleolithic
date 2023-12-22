#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Load corresponding map of Europe and dataset ####
load("Maps/Europe continent Transition and UP.RData")
Trans.Indus <- readODS::read_ods("Datasets/European-Transitional-Industries.ods")

table(Trans.Indus$Complex)

Trans.Indus <- Trans.Indus %>% mutate(
  Complex = case_when(
    Complex == "Szeletiense" ~ "Szeletian",
    Complex == "LRJ" ~ "LRJ",
    Complex == "Chatelperroniense" ~ "Chatelperronian",
    Complex == "Uluzziense" ~ "Uluzian"
  ))

#### Plot map ####
ggmap(Europe.Map2) +
  theme_map() +
  
  stat_ellipse(data = Trans.Indus, 
               aes(longitude, latitude, 
                   color = Complex, fill = Complex), 
               alpha = 0.3, geom = "polygon", level = 0.8, show.legend = FALSE) +
  
  geom_point(data = Trans.Indus,
             aes(longitude, latitude, fill = Complex, shape = Complex), 
             size =  4, alpha = 1, color = "black")  +
  
  geom_label(aes(x = -5.22, y = 35.2, label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2.5, alpha = 0.5) +
  
  geom_label(aes(x = 17, y = 59, label = "Transitional Industries (45 - 39 Ka)"),
             color = "black", fill = "white", size = 6, alpha = 0.5, fontface = "bold") +
  
  ggsci::scale_fill_jco(name = "Industry") +
  ggsci::scale_color_jco(name = "Industry") +
  scale_shape_manual(values = c(21:24),
                     name = "Industry") +
  
  theme(
    legend.position = c(0.817, 0.001),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 13),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 11)
  )

##### Save map ####
ggsave(
  "Images-english/Middle to Upper Paleolithic Transitional Industries.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 16,
  units = "cm"
)
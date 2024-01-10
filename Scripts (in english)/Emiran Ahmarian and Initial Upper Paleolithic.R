#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Load and Muggle the data ####
load("Maps/Europe & Near East.RData")
IUpPa <- readODS::read_ods("Datasets/European-Transitional-Industries.ods",
                           sheet = 3)

IUpPa <- IUpPa %>% mutate(
  longitude = as.numeric(longitude),
  latitude = as.numeric(latitude)
) %>% 
  mutate(Complex = factor(Complex, 
                          levels = c("Ahmarian & Emerian",
                                     "Aurig 0 & I"),
                          labels = c("Emiran & Ahmarian",
                                     "Aurignacian 0 & I")))

#### Map of Emirian, Ahmarian and Initial Upper Paleolithic ####
ggmap(Europe.NearEast) +
  theme_map() +
  
  geom_point(data = IUpPa,
             aes(longitude, latitude, fill = Complex, shape = Complex), 
             size =  4, alpha = 1, color = "black")  +
  
  geom_label(aes(x = 43.95, y = 30.5, label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  
  geom_label(aes(x = 19.2, y = 55, label = "Initial Upper Paleolithic sites (45 - 40 Ka)"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
  
  ggsci::scale_fill_jco(name = "Complex") +
  ggsci::scale_color_jco(name = "Complex") +
  scale_shape_manual(values = c(22:23),
                     name = "Complex") +
  
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 13),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 11)
  )


ggsave(
  "Images-english/Emiran Ahmarian and Initial Upper Paleolithic.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 16,
  units = "cm"
)
#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

load("Maps/Europe continent Transition and UP.RData")
Trans.Indus <- readODS::read_ods("Datasets/European-Transitional-Industries.ods")

ggmap(Europe.Map2) +
  theme_map() +
  
  stat_ellipse(data = Trans.Indus, 
               aes(longitude, latitude, 
                   color = Complex, fill = Complex), 
               alpha = 0.3, geom = "polygon", level = 0.8) +
  
  geom_point(data = Trans.Indus,
             aes(longitude, latitude, fill = Complex, group = 1), 
             size =  4, alpha = 1, shape = 23, color = "black")  +
  
  geom_label(aes(x = -5.25, y = 35.2, label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  
  geom_label(aes(x = 10, y = 59.8, label = "Yacimientos de complejos transicionales (45 - 39 Ka)"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
  
  ggsci::scale_fill_jco(name = "Complejo") +
  ggsci::scale_color_jco(name = "Complejo") +
  
  
  scalebar(x.min = -11.51, x.max = 47.72, y.min = 34.53, y.max = 60.46,
           anchor = c( x = 45, y = 60),
           dist = 300,
           dist_unit = "km",
           transform = TRUE,
           model =  "WGS84",
           height = 0.9, st.dist = 0.025,
           st.size = 5,
           border.size = 2) +
  
  theme(
    legend.position = c(0.785, 0.001),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 13),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 11)
  )

#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes)

#### Plot the map ###
load("Maps/Iberian Peninsula.RData")

IP.MP <- readODS::read_ods("Datasets/MP-sites-IP.ods")

ggmap(Ib.Pen) +
  theme_map() +
  geom_point(data = IP.MP,
             aes(longitude, latitude, fill = Type, shape = Type), 
             size =  5, alpha = 1) +
  
  scale_shape_manual(
    values = c(21:24),
    name = "Type",
    labels = c("Cave", "Open aire", "Rockshelter")) +
  
  ggtitle("Middle Paleolithic main sites in the Iberian Peninsula") +
  scale_fill_manual(
    name = "Type",
    labels = c("Cave", "Open aire", "Rockshelter"),
    values = c("purple", "blue", "red")) +
  
  guides(
    fill = guide_legend(nrow = 2),
    shape = guide_legend(nrow = 2)) +
  
  theme(
    legend.title = element_text(size = 12, color = "black", face = "bold"),
    legend.text = element_text(size = 11, color = "black"),
    legend.background = element_rect(color = "white"),
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5)
  )

ggsave(
  "Images-english/Middle Paleolithic main sites in the Iberian Peninsula.jpg",
  device = "jpg",
  dpi = 1200,
  width = 19,
  height = 16,
  units = "cm"
)

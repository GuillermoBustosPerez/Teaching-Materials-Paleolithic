#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Load mapa and data ####
load("Maps/Levant for Epipaleolithic.RData")

Early.Epi <- readODS::read_ods("Datasets/Epipaleolithic-Levant.ods",
                               sheet = 1)

#### Mapa epipaleolítico inicial ####
ggmap(Levant.NE) +
  theme_map() +
  geom_point(data = Early.Epi,
             aes(latitude, longitude, fill = culture),
             shape = 23, color = "black",
             size =  4, alpha = 1) +
  stat_ellipse(data = Early.Epi, aes(latitude, longitude, color = culture)) +
  scale_fill_manual(
    values = c("red", "blue"),
    labels = c("Kebarian", "Nebekian")) +
  scale_color_manual(
    values = c("red", "blue"),
    labels = c("Kebarian", "Nebekian")) +
  
  labs(fill = "Culture", color = "Culture") +
  geom_label(aes(x = 35, y = 35.2, label = "Initial Epipaleolithic (25 - 19 Ka)"),
             color = "black", fill = "white", size = 5, alpha = 0.5, fontface = "bold") +
  
  theme(
    legend.text = element_text(size = 12, color = "black"),
    legend.title = element_text(color = "black", face = "bold", size = 12.5),
    legend.background = element_rect(color = "white")
  )

ggsave(
  "Images-english/Epipialeolithic Initial.jpg",
  device = "jpg",
  dpi = 1200,
  width = 13,
  height = 18,
  units = "cm"
)

#### Mapa del epipaleolítico Medio ####
Mid.Epi <- readODS::read_ods("Datasets/Epipaleolithic-Levant.ods",
                             sheet = 2)

ggmap(Levant.NE) +
  theme_map() +
  geom_point(data = Mid.Epi,
             aes(latitude, longitude, fill = culture),
             shape = 23, color = "black",
             size =  4, alpha = 1) +
  stat_ellipse(data = Mid.Epi, aes(latitude, longitude, color = culture)) +
  scale_fill_manual(
    values = c("darkgreen"), 
    labels = c("Geometric Kebarian")) +
  scale_color_manual(
    values = c("darkgreen"), 
    labels = c("Geometric Kebarian")) +
  labs(fill = "Culture", color = "Culture") +
  geom_label(aes(x = 35, y = 35.2, label = "Middle Epipaleolithic (19 - 15 Ka)"),
             color = "black", fill = "white", size = 5, alpha = 0.5, fontface = "bold") +
  
  theme(
    legend.text = element_text(size = 12, color = "black"),
    legend.title = element_text(color = "black", face = "bold", size = 12.5),
    legend.background = element_rect(color = "white")
  )

ggsave(
  "Images-english/Epipialeolithic Middle.jpg",
  device = "jpg",
  dpi = 1200,
  width = 13,
  height = 18,
  units = "cm"
)
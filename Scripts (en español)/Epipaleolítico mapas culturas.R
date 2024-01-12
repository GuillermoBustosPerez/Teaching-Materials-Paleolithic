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
    values = c("red", "blue")) +
  scale_color_manual(
    values = c("red", "blue")) +
  
  labs(fill = "Cultura", color = "Cultura") +
  geom_label(aes(x = 35, y = 35.2, label = "Epipaleolítico Inicial (25 - 19 Ka)"),
             color = "black", fill = "white", size = 5, alpha = 0.5, fontface = "bold") +
  
  theme(
    legend.text = element_text(size = 12, color = "black"),
    legend.title = element_text(color = "black", face = "bold", size = 12.5),
    legend.background = element_rect(color = "white")
  )

ggsave(
  "Images-español/Epipialeolítico inicial.jpg",
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
    labels = c("Kebariense Geométrico")) +
  scale_color_manual(
    values = c("darkgreen"), 
    labels = c("Kebariense Geométrico")) +
  labs(fill = "Cultura", color = "Cultura") +
  geom_label(aes(x = 35, y = 35.2, label = "Epipaleolítico Medio (19 - 15 Ka)"),
             color = "black", fill = "white", size = 5, alpha = 0.5, fontface = "bold") +
  
  theme(
    legend.text = element_text(size = 12, color = "black"),
    legend.title = element_text(color = "black", face = "bold", size = 12.5),
    legend.background = element_rect(color = "white")
  )

ggsave(
  "Images-español/Epipaleolítico Medio.jpg",
  device = "jpg",
  dpi = 1200,
  width = 13,
  height = 18,
  units = "cm"
)
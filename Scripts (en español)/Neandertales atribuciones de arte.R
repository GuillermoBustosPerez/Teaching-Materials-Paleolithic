#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Cargar mapa y datos ####
load("Maps/Europe & Near East.RData")

Nean.Art <- readODS::read_ods("Datasets/MP-sites-IP.ods",
                              sheet = 2)

#### Mugglear los datos ####
Nean.Art <- Nean.Art %>% 
  mutate(Type = factor(Type, 
                       levels = c("Engravings (portable)", 
                                        "Parietal engravings",
                                        "Painting"),
                       labels = c("Grabados (mueble)", "Grabados (parietales)",
                                  "Pinturas")))

#### Mapa yacimientos con arte atribuido a los Neandertales ####
ggmap(Europe.NearEast) + 
  theme_map() +
  geom_point(data = Nean.Art,
             aes(longitude, latitude, fill = Type, shape = Type),
             color = "black",
             size =  4, alpha = 1) +
  scale_fill_manual(
    name = "Tipo de expresión",
    values = c("red", "blue", "purple")) +
  scale_shape_manual(
    name = "Tipo de expresión",
    values = c(21:23)) +
  ggrepel::geom_label_repel(data = Nean.Art, 
                            aes(longitude, latitude, 
                                label = paste(site)), 
                            alpha = 0.8,
                            label.size = 0.08,
                            size = 3,
                            force_pull = -0.5,
                            xlim = c(-16, 40), ylim = c(28, 54),
                            box.padding = unit(0.01, "lines")) + 
  guides(fill = guide_legend(nrow = 1),
         shape = guide_legend(nrow = 1)) +
  
  theme(
    legend.text = element_text(size = 11, color = "black"),
    legend.title = element_text(color = "black", face = "bold", size = 12),
    legend.background = element_rect(color = "white")
  )

ggsave(
  "Images-español/Arte Neanderthals yacimientos.jpg",
  device = "jpg",
  dpi = 1200,
  width = 23,
  height = 14,
  units = "cm"
)
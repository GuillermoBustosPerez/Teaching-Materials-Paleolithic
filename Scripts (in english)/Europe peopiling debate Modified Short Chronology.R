library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes)

load(file = "Maps/Europe & Near East.RData")

# Cargar datos de la cronología corta modificada
SC.Mod <- readODS::read_ods("Datasets/Short-Long-Chronology-Europe-Debate.ods",
                            sheet = 3)

ggmap(Europe.NearEast) +
  theme_map() +
  geom_point(data = SC.Mod,
             aes(longitude, latitude, shape = Period, fill = Period), 
             size =  4,  alpha = 0.75, color = "black") +
  scale_shape_manual(values = c(22, 23),
                     labels = c("Final Early Pleist. sites (1.5 - 0.77 Ma)", 
                                "Initial Middle Pleist. sites (0.77 - ~0.5 Ma)"),
                     name = "Period") +
  stat_ellipse(data = SC.Mod[SC.Mod$Period != "Mid.Pleist",],
               aes(longitude, latitude, color = Period), level = 0.7, show.legend = FALSE) +
  scale_fill_manual(values = c("red", "black"),
                    labels = c("Final Early Pleist. sites (1.5 - 0.77 Ma)", 
                               "Initial Middle Pleist. sites (0.77 - ~0.5 Ma)"),
                    name = "Period") +
  
  scale_color_manual(values = c("red", "black"),
                     labels = c("Final Early Pleist. sites (1.5 - 0.77 Ma)", 
                                "Initial Middle Pleist. sites (0.77 - ~0.5 Ma)"),
                     name = "Period") +
  
  geom_hline(yintercept = 45, linewidth = 2, linetype = "dashed", alpha = 0.7) +
  
  geom_label(aes(x = -8, y = 45, label = "Parallel 45"),
             fill = "black", color = 'white', alpha = 0.7,
             size = 3) +
  
  geom_label(aes(x = 20, y = 55, label = "Modified Short Chronology: main archaeological sites"),
             fill = "white", color = 'black', alpha = 1,
             size = 7, fontface = "bold") +
  
  theme(
    legend.title = element_text(color = "black", size = 12, face = "bold"),
    legend.text = element_text(color = "black", size = 11))


ggsave(
  "Images-english/Modified Short Chronology.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 16,
  units = "cm"
)
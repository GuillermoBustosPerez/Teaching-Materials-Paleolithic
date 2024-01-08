library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes)

load(file = "Maps/Europe & Near East.RData")

#### Yacimientos achelenses cercanos a 1 Ma ####
Earl.Ach <- readODS::read_ods("Datasets/Acheulean-in-Europe.ods",
                            sheet = 1)

ggmap(Europe.NearEast) +
  theme_map() +
  geom_point(data = Earl.Ach,
             aes(longitude, latitude), 
             size =  4, alpha = 1) +
  ggrepel::geom_label_repel(data = Earl.Ach, 
                            aes(longitude, latitude, 
                                label = paste(Site, "\n", Ages, "Ma")), 
                            label.size = 0.08,
                            size = 6,
                            force_pull = -0.1,
                            xlim = c(-10, 60), ylim = c(-35, 60),
                            box.padding = unit(0.01, "lines"),
                            min.segment.length = unit(0.0002, 'lines'), 
                            nudge_y = .8) + 
  
  geom_label(aes(x = 19.2, y = 55, 
                 label = "Primeros yacimientos Achelenses en Europa"),
             color = "black", fill = "white", size = 7, alpha = 0.5, fontface = "bold") +
  
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 20),
    legend.position = "none")

ggsave(
  "Images-español/Achelense. Primeros yacimientos en Europa.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 16.5,
  units = "cm"
)

#### Yacimientos achelenses de la Península Ibérica ####
load("Maps/Iberian Peninsula.RData")

Ach.IP <- readODS::read_ods("Datasets/Acheulean-in-Europe.ods",
                              sheet = 2)

ggmap(Ib.Pen) +
  theme_map() +
  geom_point(data = Ach.IP,
             aes(longitude, latitude, fill = Type, shape = Type), 
             size =  5, alpha = 1, color = "black") +
  ggsci::scale_fill_aaas(name = "Tipo de yacimiento", 
                         labels = c("Cueva", "Aire libre")) +
  scale_shape_manual(values = c(22:24),
                     name = "Tipo de yacimiento",
                     labels = c("Cueva", "Aire libre")) +
  ggtitle("Principales yacimientos Achelenses de la Península Ibérica") +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    legend.title = element_text(size = 12, color = "black", face = "bold"),
    legend.text = element_text(size = 11, color = "black"))

ggsave(
  "Images-español/Achelense. Principales yacimientos de la PI.jpg",
  device = "jpg",
  dpi = 1200,
  width = 17,
  height = 16.25,
  units = "cm"
)

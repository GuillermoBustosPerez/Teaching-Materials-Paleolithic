library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes)

load("Maps/Western Europe.RData")

#### Cargar dataset de yacimientos en 1996 ####
Europe.Short <- readODS::read_ods("Datasets/Short-Long-Chronology-Europe-Debate.ods",
                                  sheet = 1)

#### Mapa de los principales yacimientos de la Cronología Corte previo a 1996 ####
ggmap(WEurope) +
  theme_map() +
  geom_point(data = Europe.Short,
             aes(longitude, latitude, group = 1, color = Period), 
             size =  4, alpha = 1) +
  scale_color_manual(values = c("red", "black"),
                     labels = c("Posibles yacimientos de Pleist. Inferior Final (1.5 - 0.77 Ma)", 
                                "Yacimientos de Pleist. Medio Inicial (0.77 - ~0.5 Ma)")) +
  
  ggrepel::geom_label_repel(data = Europe.Short,
                            aes(longitude, latitude, 
                                label = Site), 
                            label.size = 0.08,
                            size = 4,
                            force_pull = -0.1,
                            xlim = c(-10, 19), ylim = c(35, 54),
                            box.padding = unit(0.01, "lines"),
                            min.segment.length = unit(0.0002, 'lines'), 
                            nudge_y = .8) + 
  
  guides(colour = guide_legend(nrow = 2)) +
  ggtitle("Principales yacimientos de la cronología corta en 1996") +
  theme(
    legend.position = "bottom",
    plot.title = element_text(size = 14, hjust = 0.5, face = "bold"),
    legend.title = element_blank(),
    legend.text = element_text(size = 13.5, color = "black")
  )

ggsave(
  "Images-español/Yacimientos de la cronología corta.jpg",
  device = "jpg",
  dpi = 1200,
  width = 15,
  height = 16,
  units = "cm"
)

#### Mapa de los primeros descubrimientos de la Cronología Larga ####
load("Maps/Europe & Near East.RData")
Europe.Long <- readODS::read_ods("Datasets/Short-Long-Chronology-Europe-Debate.ods",
                                  sheet = 2)

ggmap(Europe.NearEast) +
  theme_map() +
  geom_point(data = Europe.Long,
             aes(longitude, latitude), 
             size =  4, alpha = 1) +
  xlab(NULL) +
  ylab(NULL) +
  guides(colour = guide_legend(nrow = 2)) +
  
  geom_label(aes(x = 19.2, y = 55, 
                 label = "Yacimientos de la cronología larga: primeros descubrimientos"),
             color = "black", fill = "white", size = 7, alpha = 0.5, fontface = "bold") +
  
  ggrepel::geom_label_repel(data = Europe.Long, 
                            aes(longitude, latitude, 
                                label = paste(Site, "\n", Ages, "Ma")), 
                            label.size = 0.08,
                            size = 5,
                            force_pull = -0.1,
                            xlim = c(-10, 60), ylim = c(-35, 60),
                            box.padding = unit(0.01, "lines"),
                            min.segment.length = unit(0.0002, 'lines'), 
                            nudge_y = .8) + 
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 20),
    legend.position = "none"
  )

ggsave(
  "Images-español/Cronología larga. Primeros descubrimientos.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 14.5,
  units = "cm"
)

#### Refuerzo de la cronología larga ####

Europe.Long <- readODS::read_ods("Datasets/Short-Long-Chronology-Europe-Debate.ods",
                                 sheet = 3) %>% 
  filter(Period == "Ear.Ple.Cal" & Site != "Cueva Victoria")


ggmap(Europe.NearEast) +
  theme_map() +
  geom_point(data = Europe.Long,
             aes(longitude, latitude), 
             size =  4, alpha = 1) +
  xlab(NULL) +
  ylab(NULL) +
  guides(colour = guide_legend(nrow = 2)) +
  
  geom_label(aes(x = 22, y = 55, 
                 label = "Refuerzo de la Cronología Larga: principales yacimientos"),
             color = "black", fill = "white", size = 7, alpha = 0.5, fontface = "bold") +
  
  ggrepel::geom_label_repel(data = Europe.Long, 
                            aes(longitude, latitude, 
                                label = paste(Site)), 
                            label.size = 0.08,
                            size = 3,
                            force_pull = -0.01,
                            xlim = c(-10, 60), ylim = c(-35, 60),
                            box.padding = unit(0.01, "lines"),
                            min.segment.length = unit(0.0002, 'lines'), 
                            nudge_y = .8) + 
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 20),
    legend.position = "none"
  )

ggsave(
  "Images-español/Refuerzo de la cronología larga.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 16,
  units = "cm"
)
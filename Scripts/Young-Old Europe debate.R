library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes)

load("Maps/Western Europe.RData")

#### Load dataset of some European sites in 1996 ####
Europe.Short <- readODS::read_ods("Datasets/Short-Long-Chronology-Europe-Debate.ods",
                                  sheet = 1)

#### Plot map of sites according to the 1996 Short Chronology ####
ggmap(WEurope) +
  theme_map() +
  geom_point(data = Europe.Short,
             aes(longitude, latitude, group = 1, color = Period), 
             size =  4, alpha = 1) +
  scale_color_manual(values = c("red", "black"),
                     labels = c("Posibles yacimientos de Pleistoceno Inferior (2.58 - 0.77 Ma)", 
                                "Yacimientos de Pleistoceno Medio (0.77 - 0.126 Ma)")) +
  
  ggrepel::geom_label_repel(data = Europe.Short,
                            aes(longitude, latitude, 
                                label = Site), 
                            label.size = 0.08,
                            size = 5,
                            force_pull = -0.1,
                            xlim = c(-10, 19), ylim = c(35, 54),
                            box.padding = unit(0.01, "lines"),
                            min.segment.length = unit(0.0002, 'lines'), 
                            nudge_y = .8) + 
  
  guides(colour = guide_legend(nrow = 2)) +
  ggtitle("Yacimientos de la cronología corta en 1996") +
  theme(
    legend.position = "bottom",
    plot.title = element_text(size = 14, hjust = 0.5, face = "bold"),
    legend.title = element_blank(),
    legend.text = element_text(size = 13.5, color = "black")
  )

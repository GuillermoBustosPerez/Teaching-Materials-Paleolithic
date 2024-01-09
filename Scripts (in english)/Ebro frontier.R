#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Load corresponding map and data ####
load("Maps/Iberian Peninsula.RData")
Ebro.Frontier <- readODS::read_ods("Datasets/Transition-Ebro-frontier.ods")

#### Plot map and data ####
ggmap(Ib.Pen) +
  theme_map() +
  
  geom_segment(x = -8.502987607913052, y = 43.48982059674159, 
               xend = 1.8209055521726663, yend = 40.4,
               linetype = "dashed",
               alpha = 0.5, linewidth = 2) +
  geom_point(data = Ebro.Frontier,
             aes(longitude, latitude, shape = Lithic.Tech, 
                 fill = Lithic.Tech),  color = "black", size =  5, alpha = 1) +
  
  scale_fill_manual(
    name = "Complex:",
    labels = c("Aurignacian", "Chatelperronian", "Middle Paleolithic"), 
    values = c("red", "blue", "purple")) +
  scale_shape_manual(
    name = "Complex:",
    labels = c("Aurignacian", "Chatelperronian", "Middle Paleolithic"), 
    values = c(21:24)) +
  
  ggrepel::geom_label_repel(data = Ebro.Frontier, 
                            aes(longitude, latitude, 
                                label = paste(Site)), 
                            alpha = 0.8,
                            label.size = 0.08,
                            size = 4,
                            force_pull = -0.005,
                            xlim = c(-9, 3.6), ylim = c(36, 43),
                            box.padding = unit(0.01, "lines")) + 
  
  theme(
    legend.title = element_text(size = 12, color = "black", face = "bold"),
    legend.text = element_text(size = 12, color = "black"),
    legend.background = element_rect(color = "white"),
    legend.position = c(0.752, 0.0)
  )

ggsave(
  "Images-english/Ebro frontier.jpg",
  device = "jpg",
  dpi = 1200,
  width = 20,
  height = 15,
  units = "cm"
)
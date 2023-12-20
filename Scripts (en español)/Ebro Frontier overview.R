#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

# Load map of Iberian Peninsula
load("Maps/Iberian Peninsula & Ebro frontier map.RData")

# Laod data of sites
Data.Trans <- readODS::read_ods("Datasets/Transition-Ebro-frontier.ods")

#### Plot general overview of the Ebro Frontier Model ####
ggmap(Ib.Pen) +
  theme_map() +
  
  geom_segment(x = -8.502987607913052, y = 43.48982059674159, 
               xend = 1.8209055521726663, yend = 40.4,
               linetype = "dashed",
               alpha = 0.5,
               linewidth = 2) +
  geom_point(data = Data.Trans,
             aes(longitude, latitude, group = 1, 
                 colour = Lithic.Tech), 
             size =  4, alpha = 1) +
  
  xlab(NULL) +
  ylab(NULL) +
  guides(colour = guide_legend(nrow = 2)) +
  ggrepel::geom_label_repel(data = Data.Trans, 
                            aes(longitude, latitude, 
                                label = paste(Site)), 
                            alpha = 0.8,
                            label.size = 0.08,
                            size = 3,
                            force_pull = -0.005,
                            xlim = c(-8, 7), ylim = c(36, 43),
                            box.padding = unit(0.01, "lines")) + 
  scale_color_manual(
    labels = c("Auriñaciense", "Chatelperroniense", "Paleolítico Medio"), 
    values = c("red", "blue", "purple")) +
  guides(color = guide_legend(nrow = 3)) +
  
  theme(
    legend.title = element_blank(),
    legend.text = element_text(size = 12, color = "black"),
    legend.background = element_rect(color = "white"),
    legend.position = c(0.74, 0.01)
  )
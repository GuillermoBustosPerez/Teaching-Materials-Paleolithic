#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

load("Europe-Asia-Africa Map.RData")

#### Sites with claimings of Middle Pleistocene art ####
Sites <- data.frame(
  Site = c("Trinil", "Bilzingsleben", "Tan Tan", "Berekhat Ram"),
  Latitude.DD = c(-7.3743, 
                  51.27183326095597, 
                  28.441111, 
                  33.232222),
  Longitude.DD = c(111.3578,	
                   11.06047329906648,
                   -11.103889,
                   35.766389),
  Type = c("Engravings", "Engravings", "Venus", "Venus"))

#### Map of sites with claimings of Middle Pleistocene art ####
ggmap(Art.Mid.Ple) +
  theme_map() +
  geom_point(data = Sites,
             aes(Longitude.DD, Latitude.DD, fill = Type),
             shape = 23, color = "black",
             size =  4, alpha = 1) +
  scale_fill_manual(
    values = c("red", "blue")) +
  labs(fill = "Type of expresion") +
  
  ggrepel::geom_label_repel(data = Sites, 
                            aes(Longitude.DD, Latitude.DD, 
                                label = paste(Site)), 
                            alpha = 0.8,
                            label.size = 0.08,
                            size = 5,
                            force_pull = -0.5,
                            xlim = c(-22.3, 152), ylim = c(-10, 56),
                            box.padding = unit(0.01, "lines")) + 
  
  
  theme(
    legend.text = element_text(size = 12, color = "black"),
    legend.title = element_text(color = "black", face = "bold", size = 12.5),
    legend.background = element_rect(color = "white")
  )

ggsave(
  "Images-english/Middle Pleistocene sites with claimings of art.jpg",
  device = "jpg",
  dpi = 1200,
  width = 23,
  height = 14,
  units = "cm"
)

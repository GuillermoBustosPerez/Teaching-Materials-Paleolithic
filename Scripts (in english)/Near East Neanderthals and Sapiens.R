#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Load and muggle the data ####
load("Maps/Near East.RData")
NE.Cross <- readODS::read_ods("Datasets/Sapiens-Neand-Denisovans.ods",
                              sheet = 2)

NE.Cross <- NE.Cross %>% 
  mutate(
    Remains = factor(Remains, level = c("Neanderthals", "Sapiens", "Both", "None"),
                     labels = c("Neanderthals", "Sapiens", "Both", "None")))

#### Near east general view of Neanderthals and Sapiens ####
ggmap(N.East) +
  theme_map() +
  geom_point(data = NE.Cross,
             aes(longitude, latitude, fill = Remains), 
             size =  5, alpha = 0.75, shape = 23,color = "black") +
  ggsci::scale_fill_d3(name = "Remains") +
  labs(title = "Near East sites between 130 - 45 Ka") +
  
  geom_label(aes(x = 46.5, y = 27.9,
                 label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2) +
  theme(
    plot.title = element_text(size = 13, color = "black", face = "bold", hjust = 0.5),
    legend.title = element_text(size = 12, color = "black", face = "bold", hjust = 0.5),
    legend.text = element_text(size = 11, color = "black")
  )

ggsave(
  "Images-english/Near East Neanderthals ans Sapiens.jpg",
  device = "jpg",
  dpi = 1200,
  width = 18,
  height = 12,
  units = "cm"
)

##### Load map focused on the Levant of Near East ####
load("Maps/Near East Levant.RData")

#### Yacimientos con etiqueta ####
Sites.Label <- NE.Cross %>% filter(
  locality == "Hayonim Cave" | 
    locality == "Tabun Cave" |
    locality == "Amud Cave" | 
    locality == "Kebara Cave" | 
    locality == "Qafzeh" |
    locality == "Skhul" |
    locality == "Misliya Cave" | 
    locality == "Nesher Ramla" | 
    locality == "Ksar Akil" |
    locality == "Umm el Tlel")

#### Map focused on the Levant of Near East Neanderthals and Sapiens ####
ggmap(Lev.Coast) +
  theme_map() +
  geom_point(data = NE.Cross,
             aes(longitude, latitude, fill = Remains), 
             size =  5, alpha = 0.75, shape = 23,color = "black") +
  ggsci::scale_fill_d3(name = "Remains") +
  
  ggrepel::geom_label_repel(data = Sites.Label, 
                            aes(longitude, latitude, label = locality, fill = Remains),
                            alpha = 0.8,
                            color = "black",
                            label.size = 0.01,
                            force = 2,
                            size = 3.5,
                            xlim = c(30, 34.6), ylim = c(31, 36),
                            box.padding = unit(0.01, "lines"),
                            show.legend = FALSE) + 
  
  geom_label(aes(x = 31, y = 36,
                 label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 3) +
  
  theme(
    legend.title = element_text(size = 12, color = "black", face = "bold", hjust = 0.5),
    legend.text = element_text(size = 11, color = "black"))

ggsave(
  "Images-english/Near East Levant Neanderthals and Sapiens.jpg",
  device = "jpg",
  dpi = 1200,
  width = 18,
  height = 12,
  units = "cm"
)
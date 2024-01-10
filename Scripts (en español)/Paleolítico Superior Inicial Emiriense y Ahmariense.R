#### Load packages ####
library(tidyverse); library(googlesheets4); library(openintro)
library(maps); library(ggmap); library(ggthemes);
library(gridExtra); library(ggsn)

#### Cargar datos y mugglear ####
load("Maps/Europe & Near East.RData")
IUpPa <- readODS::read_ods("Datasets/European-Transitional-Industries.ods",
                                 sheet = 3)

IUpPa <- IUpPa %>% mutate(
  longitude = as.numeric(longitude),
  latitude = as.numeric(latitude)
) %>% 
  mutate(Complex = factor(Complex, 
                          levels = c("Ahmarian & Emerian",
                                     "Aurig 0 & I"),
                          labels = c("Emiriense & Ahmariense",
                                     "Auriñaciense 0 & I")))

#### Mapa yacimientos Emirienses, Ahmarienses y de Paleolítico Superior inicial ####
ggmap(Europe.NearEast) +
  theme_map() +
  
  geom_point(data = IUpPa,
             aes(longitude, latitude, fill = Complex, shape = Complex), 
             size =  4, alpha = 1, color = "black")  +
  
  geom_label(aes(x = -2.75, y = 54, label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  
  geom_label(aes(x = 19.2, y = 55, label = "Yacimientos de Paleolítico Superior Inicial (45 - 40 Ka)"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
  
  ggsci::scale_fill_jco(name = "Complejo") +
  ggsci::scale_color_jco(name = "Complejo") +
  scale_shape_manual(values = c(22:23),
                     name = "Complejo") +
  
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 13),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 11)
  )

ggsave(
  "Images-español/Emiriense Ahmariense y Paleolítico Superior Inicial.jpg",
  device = "jpg",
  dpi = 1200,
  width = 25,
  height = 16,
  units = "cm"
)

#### El levante Emiriense y Ahmariense ####
load("Maps/Near East.RData")

Emi.Ahma <- IUpPa %>% 
  filter(Complex == "Emiran & Ahmarian")

ggmap(N.East) +
  theme_map() +
  coord_map(
    xlim = c(27, 43.20),
    ylim = c(27.6, 37.5)) +

  geom_point(data = Emi.Ahma,
             aes(longitude, latitude), 
             size =  5, alpha = 1, shape = 23, color = "black", fill = "purple")  +
  
  geom_label(aes(x = 30, y = 28, label = "ROCEEH Out Of Africa Database (ROAD)"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  
  geom_label(aes(x = 36, y = 37.1, label = "Yacimientos Emirienses & Ahmarienses (50 - 40 Ka)"),
             color = "black", fill = "white", size = 5.75, alpha = 0.5, fontface = "bold") +
    
  ggrepel::geom_label_repel(data = Emi.Ahma, 
                            aes(longitude, latitude, label = locality), 
                            label.size = 0.01,
                            force_pull = -0.22,
                            size = 3,
                            xlim = c(28, 43), ylim = c(28, 36),
                            box.padding = unit(0.01, "lines"),
                            nudge_y = 0.8) 

ggsave(
  "Images-español/Emiriense y Ahmariense.jpg",
  device = "jpg",
  dpi = 1200,
  width = 18,
  height = 14,
  units = "cm"
)

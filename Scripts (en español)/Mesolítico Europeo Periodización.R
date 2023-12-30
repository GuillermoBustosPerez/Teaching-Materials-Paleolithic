#### Cargar las librerías ####
library(gsloid); library(tidyverse)
df.Climate <- folio::ngrip2010

# Eventos Heinrich
H.events <- data.frame(
  Event = c("HE0", "HE1", "HE2","HE3","HE4", "HE5"),
  Age = c(12, 16.8, 23, 30, 36, 45))

#### Plot using North Greenland Ice Core Project (GICC05 time scale) ####
df.Climate  %>% ggplot(aes(age/1000, delta)) +
  geom_vline(aes(xintercept = 11.7), linetype = 2) +
  
  annotate("rect",
           xmax = 11,
           xmin = 9,
           alpha = .2,
           ymin = -Inf, 
           ymax = Inf,
           fill = "wheat") +
  geom_label(aes(x = 10, y = -29, label = "Mesolítico Inicial\n(11 - 9 Ka)"),
             fill = "wheat", color = 'black', alpha = 0.4,
             size = 5) +
  
  annotate("rect",
           xmax = 9,
           xmin = 6,
           alpha = .2,
           ymin = -Inf, 
           ymax = Inf,
           fill = "wheat3") +
  geom_label(aes(x = 7.5, y = -29, label = "Mesolítico Final\n(9 - 6 Ka)"),
             fill = "wheat3", color = 'black', alpha = 0.4,
             size = 5) +
  
  annotate("rect",
           xmax = 14.5,
           xmin = 12.9,
           alpha = 0.5,
           ymin = -Inf, 
           ymax = -35,
           fill = "indianred") +
  geom_label(aes(x = 13.7, y = -45, label = "B/A"),
             fill = "indianred", color = 'black', alpha = 0.3,
             size = 3) +
  
  annotate("rect",
           xmax = 12.9,
           xmin = 11.6,
           alpha = 0.5,
           ymin = -35, 
           ymax = -Inf,
           fill = "lightblue") +
  geom_label(aes(x = 12.25, y = -45, label = "DR"),
             fill = "lightblue", color = 'black', alpha = 0.3,
             size = 3) +
  
  geom_label(aes(x = 13.5, y = -29, label = "Paleolítico Superior"),
             fill = "white", color = 'black',
             size = 3) +
  
  geom_vline(aes(xintercept = 11.7), linetype = 2) +  # Separación Pleistoceno - Holoceno
  
  geom_line(color = "blue") +
  
  geom_label(aes(x = 7, y = -46), label = paste0("H o l o c e n o"),
             fill = "white", color = 'black', alpha = 0.5,
             size = 6) +
  
  geom_label(data = H.events, aes(x = Age, y = -47, label = paste0(Event, " ", Age, "Ka")),
             fill = "white", color = 'black',
             size = 3) +
  
  ylab(expression("NGRIP"~ delta^{18} * "0" * "‰")) +
  scale_y_continuous(breaks = seq(-46, -33, 3), lim = c(-47.5, -26)) +
  xlab("Años BP (Ka)") +
  labs(caption = "NGRP Dataset (NDAA)") +
  
  scale_x_reverse(breaks = seq(1, 16, 2)) +
  coord_cartesian(xlim = c(16, 1)) +
  theme_light() +
  theme(
    axis.text.x = element_text(size = 12, color = "black"),
    axis.text.y = element_text(size = 10, color = "black"),
    axis.title = element_text(size = 13, color = "black", face = "bold")
  )

ggsave(
  "Images-español/Periodización Mesolítico.jpg",
  device = "jpg",
  dpi = 1200,
  width = 32,
  height = 15,
  units = "cm"
)

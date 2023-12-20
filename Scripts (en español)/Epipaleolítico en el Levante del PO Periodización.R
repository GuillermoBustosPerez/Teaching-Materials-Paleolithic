#### Load gsloid library ####
library(tidyverse); library(gsloid)

#### Plot using North Greenland Ice Core Project (GICC05 time scale) ####
H.events <- data.frame(
  Event = c("HE0", "HE1", "HE2","HE3","HE4", "HE5"),
  Age = c(12, 16.8, 23, 30, 36, 45))

df.Climate <- folio::ngrip2010

df.Climate  %>% ggplot(aes(age/1000, delta)) +
  
  annotate("rect",
           xmax = 25,
           xmin = 19,
           alpha = .35,
           ymin = -Inf, 
           ymax = Inf,
           fill = "khaki1") +
  geom_label(aes(x = 22, y = -29, label = "Inicial:\nKebariense &\nNebekiense\n25-19 Ka"),
             fill = "khaki1", color = 'black',
             size = 5) +
  
  annotate("rect",
           xmax = 19,
           xmin = 15,
           alpha = .35,
           ymin = -Inf, 
           ymax = Inf,
           fill = "lightgoldenrod3") +
  geom_label(aes(x = 17, y = -29, label = "Medio:\nKebariense\nGeométrico\n19-15 Ka"),
             fill = "lightgoldenrod3", color = 'black',
             size = 5) +
  
  annotate("rect",
           xmax = 15,
           xmin = 11.6,
           alpha = .35,
           ymin = -Inf, 
           ymax = Inf,
           fill = "navajowhite4") +
  geom_label(aes(x = 13.3, y = -29, label = "Final:\nNatufiense\n15 - 11.6 Ka"),
             fill = "navajowhite4", color = 'black',
             size = 5) +
  
  geom_label(aes(x = 9, y = -29, label = "N e o l í t i c o"),
             fill = "white", color = 'black',
             size = 3) +
  
  geom_label(aes(x = 27, y = -28, label = "Paleolítico\nSuperior"),
             fill = "white", color = 'black',
             size = 3) +
  
  annotate("rect",
           xmax = 14.5,
           xmin = 12.9,
           ymin = -Inf, 
           ymax = -35,
           fill = "indianred",
           alpha = 0.5) +
  geom_label(aes(x = 13.7, y = -45, label = "B/A"),
             fill = "indianred", color = 'black', alpha = 0.3,
             size = 3) +
  
  annotate("rect",
           xmax = 12.9,
           xmin = 11.6,
           ymin = -35, 
           ymax = -Inf,
           fill = "lightblue",
           alpha = 0.5) +
  geom_label(aes(x = 12.25, y = -45, label = "DR"),
             fill = "lightblue", color = 'black', alpha = 0.3,
             size = 3) +
  
  
  geom_vline(aes(xintercept = 11.7), linetype = 2) +  # Separación Pleistoceno - Holoceno
  
  geom_label(data = H.events, aes(x = Age, y = -47, label = paste0(Event, " ", Age, "Ka")),
             fill = "white", color = 'black',
             size = 3) +
  
  geom_line(color = "blue") +
  theme_light() +
  ylab(expression("NGRIP"~ delta^{18} * "0" * "‰")) +
  scale_y_continuous(breaks = seq(-46, -34, 2), lim = c(-47.5, -26)) +
  xlab("Años BP (Ka)") +
  
  scale_x_reverse(breaks = seq(8, 28, 2)) +
  coord_cartesian(xlim = c(8, 28)) +
  theme(
    axis.text.x = element_text(size = 12, color = "black"),
    axis.text.y = element_text(size = 12, color = "black"),
    axis.title = element_text(size = 13, color = "black", face = "bold")
  )

ggsave(
  "Periodización del Epipaleolítico del Levante (PO).jpg",
  device = "jpg",
  dpi = 1200,
  width = 32,
  height = 15,
  units = "cm"
)
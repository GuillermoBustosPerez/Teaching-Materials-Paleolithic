##### load libraries #####
library(tidyverse); library(gsloid)

#### General periodization of upper paleolithic ####

df.Climate <- folio::ngrip2010

H.events <- data.frame(
  Event = c("HE0", "HE1", "HE2","HE3","HE4", "HE5"),
  Age = c(12, 16.8, 23, 30, 36, 45))

df.Climate  %>% ggplot(aes(age/1000, delta)) +
  
  geom_vline(aes(xintercept = 14), linetype = 2) +
  geom_vline(aes(xintercept = 29), linetype = 2) +
  
  annotate("rect",
           xmax = 42,
           xmin = 38,
           alpha = .2,
           ymin = -Inf, 
           ymax = Inf,
           fill = "gold") +
  
  annotate("rect",
           xmax = 38,
           xmin = 28,
           alpha = .5,
           ymin = -Inf, 
           ymax = Inf,
           fill = "gold") +
  annotate("rect",
           xmax = 28,
           xmin = 22,
           alpha = .5,
           ymin = -Inf, 
           ymax = Inf,
           fill = "darkolivegreen2") +
  annotate("rect",
           xmax = 22,
           xmin = 17,
           alpha = .5,
           ymin = -Inf, 
           ymax = Inf,
           fill = "blue") +
  annotate("rect",
           xmax = 17,
           xmin = 16,
           alpha = .3,
           ymin = -Inf, 
           ymax = Inf,
           fill = "purple") +
  
  annotate("rect",
           xmax = 16,
           xmin = 10,
           alpha = .5,
           ymin = -Inf, 
           ymax = Inf,
           fill = "purple") +
  
  geom_line(color = "blue") +
  
  ylab(expression("NGRIP"~ delta^{18} * "0" * "‰")) +
  scale_y_continuous(breaks = seq(-46, -33, 3), lim = c(-47.5, -26)) +
  xlab("Years BP (Ka)") +
  
  geom_label(aes(x = 9.5, y = -26, label = "MIS 1"),
             fill = "white", color = 'black',
             size = 3) +
  geom_label(aes(x = 23, y = -26, label = "MIS 2"),
             fill = "white", color = 'black',
             size = 3) +
  
  geom_label(aes(x = 44, y = -26, label = "MIS 3"),
             fill = "white", color = 'black',
             size = 3) +
  
  
  geom_label(aes(x = 13, y = -29, label = "Magdalenian\n16-10 Ka"),
             fill = "darkorchid1", color = 'black',
             size = 5) +
  geom_label(aes(x = 17, y = -33.5, label = "Initial\nMagdalenian\n17\n-\n16\nKa"),
             fill = "purple", color = 'black',
             size = 4) +
  
  geom_label(aes(x = 19.5, y = -29, label = "Solutrean\n22-17 Ka"),
             fill = "blue", color = 'black',
             size = 5) +
  
  geom_label(aes(x = 25, y = -31, label = "Gravetian\n28-22 Ka"),
             fill = "darkolivegreen2", color = 'black',
             size = 5) +
  geom_label(aes(x = 33, y = -29, label = "Aurignacian\n38-28 Ka"),
             fill = "gold", color = 'black',
             size = 5) +
  geom_label(aes(x = 40, y = -31, label = "Proto-\nAurignacian\n42\n-\n38 Ka"),
             fill = "gold2", color = 'black',
             size = 4) +
  geom_label(aes(x = 44, y = -35.5, label = "Middle\npaleolithic"),
             fill = "white", color = 'black',
             size = 3) +
  
  geom_label(data = H.events, aes(x = Age, y = -47, label = paste0(Event, " ", Age, "Ka")),
             fill = "white", color = 'black',
             size = 3) +
  
  scale_x_reverse(breaks = seq(4, 45, 2)) +
  coord_cartesian(xlim = c(45, 8)) +
  labs(caption = "NGRP Dataset (NDAA)") +
  theme_light() +
  theme(
    axis.text.x = element_text(size = 12, color = "black")
  )

ggsave(
  "Images-english/Upper Paleolithic of Western Europe periodization.jpg",
  device = "jpg",
  dpi = 1200,
  width = 32,
  height = 15,
  units = "cm"
)

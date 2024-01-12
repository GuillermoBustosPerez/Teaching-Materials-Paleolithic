library(tidyverse); library(gsloid)

#### Datos del descenso del nivel del mar comparados con profundidad máxima de estrechos
gsloid::spratt2016 %>% 
  ggplot(aes(age_calkaBP, SeaLev_shortPC1)) +
  geom_hline(yintercept = -55, linetype = "dashed", color = "purple") + # Dardanelles
  geom_hline(yintercept = -36, linetype = "dashed", color = "brown") +  # Bosphorus
  geom_line(color = "blue", linewidth = 1) +
  ylab("Mean sea level in m") +
  xlab("Years BP Ka") +
  theme_light() +
  geom_label(aes(x = 0, y = -55, label = "Dardanelles"),
             color = "purple", fill = "white", size = 3.5, alpha = 0.5) +
  geom_label(aes(x = 0, y = -36, label = "Bosphorus"),
             color = "brown", fill = "white", size = 3.5, alpha = 0.5) +
  geom_label(aes(x = 400, y = -140, label = "Data from Spratt & Lisiecki, 2016"),
             color = "black", fill = "white", size = 2, alpha = 0.5) +
  
  scale_x_continuous(breaks = seq(0, 430, 50), lim = c(0, 430)) +
  scale_y_continuous(breaks = seq(-140, 10, 10), lim = c(-140, 20)) +
  theme(
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(color = "black", size = 12, face = "bold")
  )


ggsave(
  "Images-english/Sea level and maximum depth of Bosforus and Dardanelles.jpg",
  device = "jpg",
  dpi = 1200,
  width = 32,
  height = 10,
  units = "cm"
)
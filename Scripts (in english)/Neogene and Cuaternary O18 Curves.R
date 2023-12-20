library(tidyverse); library(gsloid)

#### O18 Curve of Neogene ####
# Curva O18 Neógeno 
lisiecki2005 %>% filter(Time >= 2800) %>% 
  ggplot(aes((Time/1000), d18O)) +
  geom_line(color = "blue") +
  scale_y_reverse(name = bquote(delta^18*O),
                  breaks = seq(2, 5.5, 0.5), lim = c(5.5, 2)) +
  xlab("Years Ma") +
  geom_hline(yintercept = 3.75, linetype = "dashed") +
  geom_hline(yintercept = 2.75, linetype = "dashed") +
  ggtitle("Neogene (Prior to the Cuaternary)") +
  scale_x_reverse(breaks = seq(2.8, 5.3, 0.2)) +
  geom_label(aes(x = 3, y = 5.4, 
                 label = "(Lisiecki & Raymo 2005)"),
             color = "black", fill = "white", size = 4, alpha = 0.5) +
  theme_light() +
  theme(
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(color = "black", size = 11, face = "bold")
  )

ggsave(
  "Images-english/O18 curve of the del Neogene.jpg",
  device = "jpg",
  dpi = 1200,
  width = 32,
  height = 10,
  units = "cm"
)

#### O18 Curve of the Cuaternary ####
lisiecki2005 %>% filter(Time <= 2800) %>% 
  ggplot(aes((Time/1000), d18O)) +
  geom_line(color = "blue") + 
  scale_y_reverse(name = bquote(delta^18*O),
                  breaks = seq(2, 5.5, 0.5), lim = c(5.5, 2)) +
  xlab("Years Ma") +
  ggtitle("Cuaternary") +
  scale_x_reverse(breaks = seq(0, 2.8, 0.2)) +
  geom_hline(yintercept = 5, linetype = "dashed") +
  geom_hline(yintercept = 3, linetype = "dashed") +
  theme_light() +
  geom_label(aes(x = 0.2, y = 5.4, 
                 label = "(Lisiecki & Raymo 2005)"),
             color = "black", fill = "white", size = 4, alpha = 0.5) +
  theme(
    axis.text = element_text(color = "black", size = 11),
    axis.title = element_text(color = "black", size = 11, face = "bold")
  )

ggsave(
  "Images-english/O18 curve of the Cuaternary (no subdivisions).jpg",
  device = "jpg",
  dpi = 1200,
  width = 32,
  height = 10,
  units = "cm"
)
library(tidyverse); library(gsloid)

##### Comparación curvas O18 Pleist inferior, Medio y Superior#####

lisiecki2005 %>% filter(Time >= 11.7 & Time <= 2580) %>% 
  mutate(Periodo = case_when(
    Time >= 774   ~ "Pleist. Inferior (2.58 Ma - 773 Ka)",
    Time < 774 & Time >= 126 ~ "Pleist. Medio (773 - 126 Ka)",
    Time < 126 ~ "Pleist. Superior (126 - 11.7 Ka)")) %>% 
  
  ggplot(aes((Time/1000), d18O, color = Periodo)) +
  geom_path(aes(group = 1), linewidth = 1) +
  scale_y_reverse(name = bquote(delta^18*O),
                  breaks = seq(2, 5.5, 0.5), lim = c(5.5, 2)) +
  xlab("Años Ma BP") +
  ggsci::scale_color_aaas() +
  labs(caption = "Datos de Lisiecki & Raymo, 2005") +
  scale_x_reverse(breaks = seq(0, 2.580, 0.2)) +
  theme_light() +
  guides(color = guide_legend(nrow = 1)) +
  theme(
    legend.position = "top",
    axis.text = element_text(color = "black", size = 12),
    axis.title = element_text(color = "black", size = 13, face = "bold"),
    legend.text = element_text(color = "black", size = 13),
    legend.title = element_text(color = "black", size = 13.5, face = "bold"),
  )


ggsave(
  "Images-español/Curva O18 del Cuaternario.jpg",
  device = "jpg",
  dpi = 1200,
  width = 32,
  height = 10,
  units = "cm"
)


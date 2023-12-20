#### Load linbraries #####
library(tidyverse); library(gsloid)

#### O18 Curves of Middle and Upper Pleistocene ####
mis_last_250ka <-
  LR04_MISboundaries %>% filter(LR04_Age_ka_start >= 11.7 & LR04_Age_ka_end <= 300)

lisiecki2005 %>% filter(Time >= 11.7 & Time <= 300) %>% 
  mutate(Period = case_when(
    Time < 774 & Time >= 126 ~ "Middle Pleist. (773 - 126 Ka)",
    Time < 126 ~ "Upper Pleist. (126 - 11.7 Ka)")) %>% 
  
  ggplot(aes(Time, d18O, color = Period)) +
  geom_path(aes(group = 1), linewidth = 1) +
  scale_color_manual(values = c("purple", "orange")) +
  scale_x_reverse(breaks = seq(20, 300, 20), lim = c(300, 11.7)) +
  
  scale_y_reverse(name = bquote(delta^18*O),
                  breaks = seq(2, 5, 0.5), lim = c(5.5, 2)) +
  theme_light() +
  annotate("rect", 
           xmin = mis_last_250ka$LR04_Age_ka_end, 
           xmax = mis_last_250ka$LR04_Age_ka_start, 
           ymin = -Inf, 
           ymax = Inf,
           alpha = .2,
           fill = rep(c("grey70", "white"), 
                      nrow(mis_last_250ka)/2)) +
  annotate("text", 
           label = mis_last_250ka$label_MIS, 
           x =     mis_last_250ka$LR04_Age_ka_mid,
           y = c(rep(3, 4), 
                 seq(3.1, 2.8, length.out = 7),
                 rep(3, 3)),
           size = 4.5) +
  
  xlab("Years BP Ka") +
  labs(caption = "Data from Lisiecki & Raymo, 2005") +
  guides(color = guide_legend(nrow = 1)) +
  theme(
    legend.position = "top",
    axis.text = element_text(color = "black", size = 12),
    axis.title = element_text(color = "black", size = 13, face = "bold"),
    legend.text = element_text(color = "black", size = 13),
    legend.title = element_text(color = "black", size = 13.5, face = "bold"),
  )

ggsave(
  "Images-english/O18 curves of Middle and Upper Pleistocene.jpg",
  device = "jpg",
  dpi = 1200,
  width = 32,
  height = 13,
  units = "cm"
)

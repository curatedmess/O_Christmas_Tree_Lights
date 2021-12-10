# O Christmas Tree Lights
# #SWDChallenge December 2021
# Points created using WebPlotDigitizer from a basic png image
# Cost information calculated using formulas found on https://www.christmaslightsetc.com/pages/how-much-power.htm

# libraries
library(tidyverse)
library(showtext)
library(ggtext)
library(ggshadow)

# add font
font_add_google(name = "Mr Dafoe", family = "Mr Dafoe")
font_add_google(name = "Montserrat", family = "Montserrat")

# turn on showtext
showtext_auto()

# load data
data <- readr::read_csv("O_Christmas_Tree_Lights.csv")

# view data
view(data)

#plot tree lights
data %>%
  ggplot(aes(x = X, y = Y)) +
  geom_glowpoint(size = 0.5,
                 alpha = 0.9,
                 color = "#FFFFFF",
                 shadowsize = 0.75,
                 shadowalpha = 0.025,
                 shadowcolor = "#FFECB3") +
  scale_y_reverse() +
  expand_limits(x = c(0,500), y = c(-60,850)) +
  annotate(geom = "text", x = 250, y = -50, label = "O Christmas Tree",
           color = "#FFFFFF", family = "Montserrat", size = 14) +
  annotate(geom = "text", x = 450, y = 0, label = "Lights",
           color = "#FFECB3", family = "Mr Dafoe", size = 12) +
  annotate(geom = "text", x = 250, y = 780, label = "To light a\nseven-foot tree with\n700 incandescent mini lights\nfor the Christmas season would\ncost an average of $5.04 in the United States.",
           color = "#FFFFFF", family = "Montserrat", size = 3.5, hjust = 0.5) +
  labs(caption = "\nDesign by: Ryan Hart | #SWDChallenge Dec 2021 | Cost calculated using christmaslightsetc.com") +
  theme_void() +
  theme(text = element_text(family = "Montserrat", color = "#FFFFFF"),
        #plot.caption = element_markdown(family = "Montserrat", color = "#FFFFFF", hjust = 0.5, margin = margin (0,10,0,10), size = 8, lineheight = 1.2),
        plot.caption = element_text(size = 7.5, hjust = 0.5, lineheight = 1.2),
        plot.margin = unit(c(1.0,1.5,1.0,1.5), "cm"),
        plot.background = element_rect(fill="#121212"))

#save plot
ggsave(paste0("OChristmasTreeLights_", format(Sys.time(), "%m%d%Y"), ".png"), dpi = 320, width = 6.5, height = 8)

  
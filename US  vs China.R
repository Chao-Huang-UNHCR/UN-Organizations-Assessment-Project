library(tidyverse)
library(unhcrthemes)
library(readxl)
library(scales)

dat <- read_xlsx("rawdata.xlsx")

df <- dat %>% gather(country, countribution, US: China)


# Plot
ggplot(df, aes(
  x = countribution,
  y = reorder(Organizations, countribution),
  fill = factor(country)
)) +
  geom_col(width = 0.7) +
  scale_x_continuous(
    expand = expansion(mult = c(0, .1)),
    labels = scales::label_percent(scale_cut = scales::cut_short_scale()),
    breaks = seq(0, 0.6, 0.1)
  ) +
  scale_fill_unhcr_d(
    palette = "pal_unhcr",
    nmax = 8,
    order = c(5, 1),
    labels = c("China", "US")
  ) +
  labs(
    title = "Governmental Contributions from US and China to UN Entities (in Percent) | 2023",
    caption = "Source: UN Organizations Assessment Project"
  ) +
  theme_unhcr(grid = "X", axis = "y", axis_title = FALSE)

# Plot with label
# ggplot(df, aes(
#   x = countribution,
#   y = reorder(Organizations, countribution),
#   fill = factor(country)
# )) +
#   geom_col(width = 0.7) +
#   geom_text(
#     aes(
#       label = scales::label_percent()(countribution)
#     ),
#     position = position_stack(vjust = .5),
#     color = "white",
#     size = 8 / ggplot2::.pt
#   ) +
#   scale_x_continuous(
#     expand = expansion(mult = c(0, .1)),
#   ) +
#   scale_fill_unhcr_d(
#     palette = "pal_unhcr",
#     nmax = 8,
#     order = c(5, 1),
#     labels = c("China", "US")
#   ) +
#   labs(
#     title = "Govermental Contributions from US and China to UN Entities | 2023",
#     caption = "Source: UN Organizations Assessment Project"
#   ) +
#   theme_unhcr(grid = "X", axis = "y", axis_title = FALSE)

library("ggmap")
library("dplyr")
library("forcats")

`%notin%` <- function(lhs, rhs) !(lhs %in% rhs)
violent_crimes1 <- crime %>%
  filter(
    offense %notin% c("auto theft", "theft", "burglary"),
    -95.54031 <= lon & lon <= -95.21878,
    29.71368 <= lat & lat <=  30.02749
  ) %>%
  mutate(
    offense = fct_drop(offense),
    offense = fct_relevel(offense, c("robbery", "aggravated assault", "rape", "murder"))
  )
qmplot(lon, lat, data = violent_crimes1, maptype = "toner-lite", color = I("red"))
qmplot(lon, lat, data = violent_crimes1, maptype = "toner-lite", geom = "density2d", color = I("red"))
robberies <- violent_crimes1 %>% filter(offense == "robbery")

library(ggplot2)
library(olsrr)
theme_set(theme_bw())  # pre-set the bw theme.

# set working directory
setwd("/Users/kelly/Desktop/2019_Spring/IsyE\ 601/project/code")

# load data
# load("five_y.RData")
# load("y2016.RData")
load("test.RData")
load("five.RData")

# what affects O2?
model <- lm(O2~depth+t+salnty+pden+press+NH3+NO3+NO2+chl+phe, data = test)
result <- ols_step_all_possible(model)
plot(result)
summary(result)

# Chlorophyll vs. O2
# Pheophytin: Chlorophyll released by dead cells or botanies.
ggplot(data = test) + 
geom_point(mapping = aes(x = chl, y = O2), color="deepskyblue2", size = .01) + 
  geom_smooth(mapping = aes(x = chl, y = O2)) +
  labs(y="dissolved oxygen in seawater (ml/L)",  # ASCII code for celcius
       x="chlorophyll-a (ug/L)",
       caption = "Chlorophyll vs. O2")

# depth vs. O2
ggplot(data = test) + 
  geom_point(mapping = aes(x = depth, y = O2), color="deepskyblue2", size = .01) + 
  geom_smooth(mapping = aes(x = depth, y = O2)) +
  labs(y="dissolved oxygen in seawater (ml/L)",  # ASCII code for celcius
       x="deoth of water (m)",
       caption = "depth of water vs. O2")

# T vs. depth
# plot on whole data set
ggplot(data = test) + 
  geom_point(mapping = aes(x = depth, y = t), color="deepskyblue2", size = .01) + 
  geom_smooth(mapping = aes(x = depth, y = t)) +
  labs(y="Temperature of Water (\u00B0C))",  # ASCII code for celcius
       x="Depth in meters (m)",
       caption = "Temperature vs. Depth of water")
md = lm(t~depth, data = test)


# Salinity vs. sio3
ggplot(data = test) + 
  geom_point(mapping = aes(x = sio3+PO4, y = salnty), color="deepskyblue2", size = .01) + 
  geom_smooth(mapping = aes(x = sio3+PO4, y = salnty)) +
  labs(y="Salinity of Water",  # ASCII code for celcius
       x="Silicate concentration & Phosphate concentration (mmol/L)",
       caption = "major salt ions vs. salinity")

# acquire regression model for salnty
model <- lm(salnty~sio3+PO4, data = test)
summary(model)

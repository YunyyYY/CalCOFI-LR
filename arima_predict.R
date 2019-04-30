library(ggplot2)
library(olsrr)
library(forecast)
theme_set(theme_bw())  # pre-set the bw theme.

# set working directory
setwd("/Users/kelly/Desktop/2019_Spring/IsyE\ 601/project/code")
load("test.RData")
load("ten.RData")
load("y89-99.RData")

attach(years)
x = tapply(years$t,years$month,mean)
raw = data.frame(time = seq(1, 52, 1), temp = x)

fit = auto.arima(x[1:32])
pred = forecast(fit, h=20)

pm = pred$mean
pl1 = pred$lower[, 1]
pl2 = pred$lower[, 2]
ph1 = pred$upper[, 1]
ph2 = pred$upper[, 2]
index =  seq(33, 52, 1)
pd = data.frame(pm, pl1, pl2, ph1, ph2,index)

ggplot() + 
  geom_ribbon(data = pd, aes(x = index, ymin = pl2, ymax = ph2), fill = "oldlace") + 
  geom_ribbon(data = pd, aes(x = index, ymin = pl1, ymax = ph1), fill = "bisque") + 
  geom_path(data = raw, aes(x = time, y = temp), color="lightskyblue2", size = 1) +
  geom_point(data = raw, aes(x = time, y = temp), color="royalblue2", size = 2) +
  geom_path(data = pd, aes(x = index, y = pm), color="orange", size = 1, linetype = 2) +
  labs(y="water temperature (\u00B0C)",  # ASCII code for celcius
       x="time",
       caption = "time vs. water temperature")


# training data
attach(ten)
mean1 = tapply(t,month,mean)
time1 = seq(1, 40, 1)
train = data.frame(time = time1, temp = mean1)

# test data
mean2 = tapply(test$t,test$month,mean)
time2 = seq(41, 44, 1)
ts = data.frame(time = time2, temp = mean2)

# time vs. water temperature in five years
ggplot() + 
  geom_path(data = train, aes(x = time, y = temp), color="lightskyblue2", size = 1) +
  geom_point(data = train, aes(x = time, y = temp), color="royalblue2", size = 2) +
  geom_path(data = ts, aes(x = time, y = temp), color="bisque1", size = 1) +
  geom_point(data = ts, aes(x = time, y = temp), color="orange2", size = 2) +
  labs(y="water temperature (\u00B0C)",  # ASCII code for celcius
       x="time",
       caption = "time vs. water temperature")

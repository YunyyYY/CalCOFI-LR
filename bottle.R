# this file extract training and predictive data from bottle.csv

# set working directory
setwd("/Users/kelly/Desktop/2019_Spring/IsyE\ 601/project/code")

# load csv data, store as RData.
# prop<-read.csv("bottle.csv",header=TRUE)

# load RData faster than read csv
load("bottle.RData")

# extract index one year time of prop
a = data.frame(prop$Depth_ID)
c = substr(a[,], 1, 5)
c = sub("-", "", c)

# y2011-y2015 are indices
y2011 = which(c %in% "2011")
y2012 = which(c %in% "2012")
y2013 = which(c %in% "2013")
y2014 = which(c %in% "2014")
y2015 = which(c %in% "2015")
y2016 = which(c %in% "2016")

# extract and store data from year 2011-2015
five = prop[c(y2011, y2012, y2013, y2014, y2015), ]
save(five, file="five_y.RData")

# extract and store data of year 2016
y2016 = prop[y2016, ]
save(y2016, file="y2016.RData")

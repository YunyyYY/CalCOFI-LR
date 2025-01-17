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
m = substr(a[,], 4, 7)

# check some years
years = as.character(seq(1989, 1999, 1))
sub = prop[which(c %in% years), ]
month = substr(sub$Depth_ID[], 4, 7)
t = sub$T_degC
depth = sub$Depthm
years = data.frame(t, depth, month)
years = years[complete.cases(years), ]
save(years, file="y89-99.RData")

x = tapply(years$t,years$month,mean)

fit = auto.arima(x[1:32])
autoplot(fit)
pred = forecast(fit, h=20)
autoplot(pred)
plot(x)

# year 2000
new = prop[which(c %in% c("2000")), ]
mm = substr(new$Depth_ID[], 4, 7)
tt = new$T_degC
xx = tapply(tt,mm,mean)

# y2011-y2015 are indices
y2006 = which(c %in% "2006")
y2007 = which(c %in% "2007")
y2008 = which(c %in% "2008")
y2009 = which(c %in% "2009")
y2010 = which(c %in% "2010")
y2011 = which(c %in% "2011")
y2012 = which(c %in% "2012")
y2013 = which(c %in% "2013")
y2014 = which(c %in% "2014")
y2015 = which(c %in% "2015")
y2016 = which(c %in% "2016")

# store ten year water temperature data
ten = prop[c(y2006, y2007, y2008, y2009, y2010, y2011, y2012, y2013, y2014, y2015), ]
hh = ten$Depth_ID
month = substr(hh[], 4, 7)
depth = ten$Depthm
t = ten$T_degC
ten = data.frame(month, depth, t)
ten = ten[complete.cases(ten), ]
ten$month = as.character(ten$month)
ten = ten[!strcmp(ten$month, "1009"), ]
ten$month = as.factor(ten$month)
save(ten, file="ten.RData")

# extract and store data of year 2016
y2016 = prop[y2016, ]
save(y2016, file="y2016.RData")

# select data from year 2016
k = y2016$Depth_ID
month = substr(k[], 1, 7)
depth = y2016$Depthm
t = y2016$T_degC
salnty = y2016$Salnty
O2 = y2016$O2ml_L
pden = y2016$STheta
press = y2016$R_PRES
NH3 = y2016$NH3uM
NO3 = y2016$NO3uM
NO2 = y2016$NO2uM
sio3 = y2016$SiO3uM
PO4 = y2016$PO4uM
chl = y2016$ChlorA  # 叶绿素
phe = y2016$Phaeop  # 脱镁叶绿素  
test = data.frame(month, depth, t, salnty, O2, pden, press, NH3, NO3, NO2, sio3, PO4, chl, phe)
test = test[complete.cases(test), ]
save(test, file="test.RData")
     
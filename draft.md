#### What affects O2? (variable selection)

pic: o2_vs_1/2: variable selection result

​		chl_O2, depth_O2: the relationship between chl. and O2 first increase then remain the same might be limited by other issues (temperature, light) which limits Photosynthesis.

```R
model <- lm(O2~depth+t+salnty+pden+press+NH3+NO3+NO2+chl+phe, data = test)
```

Summary result:

```R
     mindex             n           predictors           rsquare              adjr         
 Min.   :   1.0   Min.   : 1.000   Length:1023        Min.   :0.006809   Min.   :0.006622  
 1st Qu.: 256.5   1st Qu.: 4.000   Class :character   1st Qu.:0.814808   1st Qu.:0.814634  
 Median : 512.0   Median : 5.000   Mode  :character   Median :0.931515   Median :0.931502  
 Mean   : 512.0   Mean   : 5.005                      Mean   :0.865407   Mean   :0.865300  
 3rd Qu.: 767.5   3rd Qu.: 6.000                      3rd Qu.:0.953234   3rd Qu.:0.953190  
 Max.   :1023.0   Max.   :10.000                      Max.   :0.975905   Max.   :0.975859  
    predrsq               cp                 aic             sbic             sbc       
 Min.   :0.006002   Min.   :    10.99   Min.   :-1988   Min.   :-17108   Min.   :-1915  
 1st Qu.:0.814130   1st Qu.:  5003.63   1st Qu.: 1536   1st Qu.:-13591   1st Qu.: 1581  
 Median :0.931458   Median :  9788.16   Median : 3560   Median :-11564   Median : 3586  
 Mean   :0.864996   Mean   : 24383.91   Mean   : 5304   Mean   : -9825   Mean   : 5350  
 3rd Qu.:0.953085   3rd Qu.: 35549.41   3rd Qu.: 8868   3rd Qu.: -6264   3rd Qu.: 8914  
 Max.   :0.975726   Max.   :213838.32   Max.   :17809   Max.   :  2683   Max.   :17828  
      msep              fpe               apc               hsp           
 Min.   :0.04030   Min.   :0.04030   Min.   :0.02420   Min.   :7.566e-06  
 1st Qu.:0.07808   1st Qu.:0.07808   1st Qu.:0.04687   1st Qu.:1.466e-05  
 Median :0.11417   Median :0.11417   Median :0.06854   Median :2.143e-05  
 Mean   :0.22465   Mean   :0.22465   Mean   :0.13486   Mean   :4.217e-05  
 3rd Qu.:0.30919   3rd Qu.:0.30919   3rd Qu.:0.18561   3rd Qu.:5.804e-05  
 Max.   :1.65571   Max.   :1.65571   Max.   :0.99394   Max.   :3.108e-04  
```



#### temperature with depth

data: year 2016

Seems possible for linear regression

pic: depth, t

```R
md = lm(t~depth, data = test)
> summary(md)

Call:
lm(formula = t ~ depth, data = test)

Residuals:
    Min      1Q  Median      3Q     Max 
-4.6330 -1.2771 -0.1272  1.1618  6.7385 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) 16.6110468  0.0396452   419.0   <2e-16 ***
depth       -0.0442786  0.0004236  -104.5   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.834 on 5326 degrees of freedom
Multiple R-squared:  0.6723,	Adjusted R-squared:  0.6723 
F-statistic: 1.093e+04 on 1 and 5326 DF,  p-value: < 2.2e-16
```



#### predict water temperature variation

Model: arima

main function: `auto.arima()`.

From year 1989-1999. 

1989-1996 for training, 1997-1999 for testing.

pic: arima, arima_wide


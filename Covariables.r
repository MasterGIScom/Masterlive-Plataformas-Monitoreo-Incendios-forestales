rm(list = ls())
​
#library(RStoolbox)
#library(raster)
#library(dplyr)
​
setwd('C:/Users/user/Desktop/datos/Covariables')
​
​
lts<- brick('C:/Users/user/Desktop/datos/Covariables/postincendio/Landsat8_T1.tif')
​
?tasseledCap
​
ttc        <- tasseledCap(lts[[c(2:7)]],sat = 'Landsat8OLI')
​
nbr       <- (lts[[5]]-lts[[4]])/(lts[[5]]+lts[[4]])
​
​
writeRaster(lts, 'C:/Users/user/Desktop/datos/Covariables/lts.tif')
writeRaster(ttc, 'C:/Users/user/Desktop/datos/Covariables/ttc.tif')
writeRaster(nbr,'C:/Users/user/Desktop/datos/Covariables/nbr.tif')
​
​
cov <- list.files('C:/Users/user/Desktop/datos/Covariables',pattern = '.tif',full.names = T)
CovStack <- stack(cov)
writeRaster(CovStack,'C:/Users/user/Desktop/datos/Covariables/CovStack.tif')
​
​
​
img <- brick('C:/Users/user/Desktop/Data/covariables/CovStack.tif')
img
names(img) <- c(paste('B',c(1:7),sep = ''),'ndvi','brightness','greenness','wetness')
img
writeRaster(img,'C:/Users/user/Desktop/datos/covariables/img.tif')

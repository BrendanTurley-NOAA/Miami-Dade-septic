library(rgdal)

setwd('~/Downloads/DOH_Septic_System-shp')
septic <- readOGR('DOH_Septic_System.shp')

setwd('~/Downloads/Water_P-shp')
water <- readOGR('WaterP.shp')

setwd('~/Downloads/Street-shp')
street <- readOGR('Street.shp')


# setwd("~/Desktop/professional/biblioteca/data/shapefiles/ne_10m_admin_0_countries")
# world <- readOGR('ne_10m_admin_0_countries.shp')
# plot(world,col='gray70',xlim=c(-80.6,-80),ylim=c(25.35,26.05))

col2rgb('red')
cols <- rgb(225/255,0/255,0/255,.5)

png('Miami_map.png',height=20,width=20,units='in',res=300)
plot(water,col=4)
plot(street,add=T,lwd=.5)
plot(septic,pch=20,col=cols,add=T,cex=.75)
dev.off()

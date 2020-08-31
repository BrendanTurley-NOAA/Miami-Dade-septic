library(rgdal)

setwd('~/Desktop/miami_septic/DOH_Septic_System-shp')
septic <- readOGR('DOH_Septic_System.shp')

setwd('~/Desktop/miami_septic/Water_P-shp')
water <- readOGR('WaterP.shp')

# setwd('~/Desktop/miami_septic/Street-shp')
# street <- readOGR('Street.shp')

setwd('~/Desktop/miami_septic/Cartographic_Street-shp')
street <- readOGR('Cartographic_Street.shp')

setwd('~/Desktop/miami_septic/Florida_Shoreline__1_to_40%2C000_Scale_-shp')
coast <- readOGR('Florida_Shoreline__1_to_40%2C000_Scale_.shp')


# setwd("~/Desktop/professional/biblioteca/data/shapefiles/ne_10m_admin_0_countries")
# world <- readOGR('ne_10m_admin_0_countries.shp')
# plot(world,col='gray70',xlim=c(-80.6,-80),ylim=c(25.35,26.05))

col2rgb('red')
cols <- rgb(225/255,0/255,0/255,.5)

setwd('~/Desktop/miami_septic')
png('Miami_map.png',height=20,width=20,units='in',res=300)
plot(water,col=4)
plot(coast,add=T)
plot(street,add=T,lwd=.5)
plot(septic,pch=20,col=cols,add=T,cex=.75)
dev.off()


ind <- grep('Abandonment',septic@data$SYSTTYPE)

setwd('~/Desktop/miami_septic')
png('Miami_map2.png',height=20,width=20,units='in',res=300)
plot(water,col=4)
plot(coast,add=T)
plot(street,add=T,lwd=.5)
points(septic@coords[-ind,1],septic@coords[-ind,2],pch=20,col=cols,cex=.75)
dev.off()


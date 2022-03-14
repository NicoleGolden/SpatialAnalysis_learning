
# load spatial packages
library(sf)
library(raster)
library(rgdal)
library(ggplot2)

# set working directory
setwd("/Users/nicolegolden/Documents/1. Data Science/*GitHub/SpatialAnalysis_learning/Code/")

#---------------------------------- Example 1
# US state Boundary + country boundary + flux tower 

###################################
###       1. US Boundary        ###
###################################

# load US Boundary File
state_boundary_US <- st_read("/Users/nicolegolden/Documents/1. Data Science/*GitHub/SpatialAnalysis_learning/Data/NEON-DS-Site-Layout-Files/US-Boundary-Layers/US-State-Boundaries-Census-2014.shp")

# plot US Boundary map
ggplot() +
  geom_sf(data = state_boundary_US) +
  ggtitle("Map of Contiguous US State Boundaries") +
  coord_sf()



###################################
###   2. US Boundary Layer      ###
###################################

# load US country boundary File
country_boundary_US <- st_read("/Users/nicolegolden/Documents/1. Data Science/*GitHub/SpatialAnalysis_learning/Data/NEON-DS-Site-Layout-Files/US-Boundary-Layers/US-Boundary-Dissolved-States.shp")

# plot US state boundary + country boundary 
ggplot() +
  geom_sf(data = country_boundary_US, 
          color = "gray18", 
          size = 2) +
  geom_sf(data = state_boundary_US, 
          color = "gray40") +
  ggtitle("Map of Contiguous US State Boundaries") +
  coord_sf()



###################################
###   3. Flux Tower data        ###
###################################

# load data 
point_HARV <- st_read("/Users/nicolegolden/Documents/1. Data Science/*GitHub/SpatialAnalysis_learning/Data/NEON-DS-Site-Layout-Files/HARV/HARVtower_UTM18N.shp")

# see CRS for each file 
st_crs(point_HARV)
st_crs(state_boundary_US)
st_crs(country_boundary_US)

# see each extent 
st_bbox(point_HARV)
st_bbox(state_boundary_US)
st_bbox(country_boundary_US)

# add flux tower in state boundary 
# and country boundary map
ggplot() +
  geom_sf(data = country_boundary_US, 
          size = 2, 
          color = "gray18") +
  geom_sf(data = state_boundary_US, 
          color = "gray40") +
  geom_sf(data = point_HARV, 
          shape = 19, 
          color = "purple") +
  ggtitle("Map of Contiguous US State Boundaries") +
  coord_sf()

# NOTE: 
# need to convert all objects to same CRS for raster data 
# don't need to convert for vector data
# since ggplot automatically converts all objects 
# to the same CRS before plotting. 



#---------------------------------- Example 2
# US North Eastern + flux tower 

# load flux tower data 
point_HARV <- st_read("/Users/nicolegolden/Documents/1. Data Science/*GitHub/SpatialAnalysis_learning/Data/NEON-DS-Site-Layout-Files/HARV/HARVtower_UTM18N.shp")

# load US northeastern boundary File
US_northeastern <- st_read("/Users/nicolegolden/Documents/1. Data Science/*GitHub/SpatialAnalysis_learning/Data/NEON-DS-Site-Layout-Files/US-Boundary-Layers/Boundary-US-State-NEast.shp")

# add flux tower in northeastern boundary map 
ggplot() +
  geom_sf(data = US_northeastern, 
          aes(color ="color"), 
          show.legend = "line") +
  scale_color_manual(name = "", 
                     labels = "Northeastern Region Boundary", 
                     values = c("color" = "gray18")) +
  geom_sf(data = point_HARV, 
          aes(shape = "shape"), 
          color = "purple") +
  scale_shape_manual(name = "", 
                     labels = "Fisher Tower", 
                     values = c("shape" = 19)) +
  ggtitle("Fisher Tower location") +
  theme(legend.background = element_rect(color = NA)) +
  coord_sf()

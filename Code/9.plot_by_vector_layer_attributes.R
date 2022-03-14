
# load spatial packages
library(sf)
library(raster)
library(rgdal)
library(ggplot2)
library(dplyr)

# set working directory
setwd("/Users/nicolegolden/Documents/1. Data Science/*GitHub/SpatialAnalysis_learning/Code/")

# ----------------------------------- Example 1: 
# vector data: shape files 
# area of interest (AOI): lines extent



#####################################
###      1. Review: basics        ###
#####################################

# load data 
lines_HARV <- st_read(
  "/Users/nicolegolden/Documents/1. Data Science/*GitHub/SpatialAnalysis_learning/Data/NEON-DS-Site-Layout-Files/HARV/HARV_roads.shp")

# data type 
# lines extent (MULTILINESTRING) 
st_geometry_type(lines_HARV)

# check crs data 
st_crs(lines_HARV)

# see extent of AOI
st_bbox(lines_HARV)

# see head of data 
head(lines_HARV)

# see all data 
lines_HARV

# plot shape file 
ggplot() + 
  geom_sf(data = lines_HARV, 
          size = 1, 
          color = "black") + 
  ggtitle("Line extent Plot") + 
  coord_sf()



####################################################
###  2. Features (rows) & Attributes (columns)   ###
####################################################

# number of features (similar to number of rows)
# 13
nrow(lines_HARV)

# number of attributes (similar to number of columns)
# 16
ncol(lines_HARV)

# see names of attributes
names(lines_HARV)

# see values for attribute "TYPE"
lines_HARV$TYPE

# see unique values for attribute "TYPE"
unique(lines_HARV$TYPE)

# see number of unique values for attribute "TYPE"
length(unique(lines_HARV$TYPE))



##################################
###     3. Subset Features     ###
##################################

# subset data by "TYPE == footpath"
footpath_HARV <- lines_HARV %>% 
  filter(TYPE == "footpath")

# see subset features (number of rows)
# 2 
nrow(footpath_HARV)

# with 2 features, we can plot a line 
# plot subset data 
ggplot() + 
  geom_sf(data = footpath_HARV, 
          size = 1, 
          color = "black") + 
  ggtitle("NEON Harvard Forest Field Site", 
          subtitle = "Footpaths") + 
  coord_sf()

# we can use different colors for each feature, 
# color by variable "OBJECTID"
ggplot() + 
  geom_sf(data = footpath_HARV, 
          aes(color = factor(OBJECTID)), 
          size = 1) +
  labs(color = 'Footpath ID') +
  ggtitle("NEON Harvard Forest Field Site", 
          subtitle = "Footpaths") + 
  coord_sf()

# subset data by "TYPE == stone wall"
stonewall_HARV <- lines_HARV %>% 
  filter(TYPE == "stone wall")

# number of features 
# 6
nrow(stonewall_HARV)

# we can use different colors for each feature, 
# color by variable "OBJECTID"
ggplot() + 
  geom_sf(data = stonewall_HARV, 
          aes(color = factor(OBJECTID)), 
          size = 1) +
  labs(color = 'Stone Wall ID') +
  ggtitle("NEON Harvard Forest Field Site", 
          subtitle = "Stone Wall") + 
  coord_sf()



##################################
###     4. Customize Plots     ###
##################################

#---------------------------------
# customize line colors 

# create a vector of colors 
road_colors <- c("blue", "green", "navy", "purple")

# plot: different colors for each unique "TYPE"
ggplot() +
  geom_sf(data = lines_HARV, 
          aes(color = TYPE)) + 
  # specify colors & line width
  scale_color_manual(values = road_colors) +
  # legend label
  labs(color = 'Road Type') +
  ggtitle("NEON Harvard Forest Field Site", 
          subtitle = "Roads & Trails") + 
  coord_sf()

#---------------------------------
# customize line width 

# create a vector of line width
line_widths <- c(0.2, 0.3, 0.4, 20.5)

# plot: different width for each unique "TYPE"
ggplot() +
  geom_sf(data = lines_HARV, 
          aes(size = TYPE)) + 
  # specify colors & line width
  scale_color_manual(values = line_widths) +
  # legend label
  labs(size = 'Road Type') +
  ggtitle("NEON Harvard Forest Field Site", 
          subtitle = "Roads & Trails") + 
  coord_sf()

#---------------------------------
# customize both line colors and line width 

# create a vector of colors 
road_colors <- c("blue", "green", "navy", "purple")

# create a vector of line width
line_widths <- c(0.5, 1, 1.5, 2)

# plot: different colors for each unique "TYPE"
ggplot() +
  geom_sf(data = lines_HARV, 
          aes(color = TYPE,
              size = TYPE)) + 
  # specify colors & line width
  scale_color_manual(values = c(road_colors, 
                                line_widths)) +
  # legend label
  labs(color = 'Road Type',
       size = 'Type') +
  ggtitle("NEON Harvard Forest Field Site", 
          subtitle = "Roads & Trails") + 
  coord_sf()

#---------------------------------
# customize legend 

# create a vector of colors 
road_colors <- c("blue", "green", "navy", "purple")

# plot: different colors for each unique "TYPE"
ggplot() +
  geom_sf(data = lines_HARV, 
          aes(color = TYPE)) + 
  # specify colors & line width
  scale_color_manual(values = road_colors) +
  # customize legend: add box frame
  theme(legend.text = element_text(size = 14), 
        legend.box.background = element_rect(size = 1)) + 
  # legend label
  labs(color = 'Road Type') +
  ggtitle("NEON Harvard Forest Field Site", 
          subtitle = "Roads & Trails") + 
  coord_sf()

#---------------------------------
# Plot in green: 
# "only roads where bicycles and horses are allowed"
# the other roads in gray

# remove na value 
lines_removeNA <- lines_HARV[!is.na(lines_HARV$BicyclesHo), ] 

# subset data: bicycle/horse allowed road 
lines_bicycle <- lines_removeNA %>% 
  filter(BicyclesHo == "Bicycles and Horses Allowed")

# plot: different colors for each unique "TYPE"
ggplot() + 
  geom_sf(data = lines_HARV) + 
  geom_sf(data = lines_bicycle, 
          aes(color = BicyclesHo), 
          size = 1) + 
  scale_color_manual(values = "green") +
  ggtitle("NEON Harvard Forest Field Site", 
          subtitle = "Roads Where Bikes and Horses Are Allowed") + 
  coord_sf()


# Create a map of the state boundaries 
# load data 
US_regions <- st_read("/Users/nicolegolden/Documents/1. Data Science/*GitHub/SpatialAnalysis_learning/Data/NEON-DS-Site-Layout-Files/US-Boundary-Layers/US-State-Boundaries-Census-2014.shp")

# define colors 
region_colors <- c("yellow", "navy", "orange", 
                   "green", "red")

# plot: different colors for each unique "region"
ggplot() + 
  geom_sf(data = US_regions, 
          aes(color = region), 
          size = 1) + 
  scale_color_manual(values = region_colors) +
  ggtitle("Map of US Regions") + 
  coord_sf()



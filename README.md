# Spacial Analysis 

<img src="Image/cover.png" width="140">

* This is a self-paced learning for R `sf` package that supports many kinds of spatial analysis.  
* See instructions below to set up dependencies for `sf` package in R.
* For spatial analysis tutorials, visit short tutorial (https://ucmerced.github.io/2021-03-22-ucmerced/) or long tutorial (https://datacarpentry.org/r-raster-vector-geospatial/)

## :wrench: Set up spatial analysis programs 
* Install R. 
* Install RStudio. 
* Install `sf` package in RStudio.
* Install RTools (see general instructions (https://datacarpentry.org/geospatial-workshop/setup.html) or simply download the pacakge here (http://www.kyngchaos.com/software/frameworks/)), including: 
	* `GDAL`
	* `GEOS`
	* `PROJ.4` 
* After installed RTools, open RStudio, in an R Script, type code below and run the code. Now the `rf` package dependency setup is complete.

```
writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
```
* Download spatial analysis packages: 

```
install.packages(c("dplyr", "ggplot2", "raster", "rgdal", "rasterVis", "sf"))
```

## :arrow_down: Download data 
* Download spatial data for this training here (https://ndownloader.figshare.com/articles/2009586/versions/10).
* For an overview of the data, visit this page (https://datacarpentry.org/geospatial-workshop/data/).

## :blue_book: Course Outline 
1. **Basics:** Introduction to Raster Data  
2. **Basics:** Coordinate Reference Systems 
3. **Basics:** Introduction to Vector Data 
4. **Code**: Plot raster data 
5. **Code**: Reproject Raster Data 
6. **Code**: Raster Calculations 
7. **Code**: Work With Multi-Band Rasters 
8. **Code**: Open and Plot Shapefiles 
9. **Code**: Explore and Plot by Vector Layer Attributes 
10. **Code**: Plot Multiple Shapefiles 
11. **Code**: Handling Spatial Projection & CRS 
12. **Code**: Convert from .csv to a Shapefile 
13. **Code**: Manipulate Raster Data 
14. **Code**: Raster Time Series Data 
15. **Code**: Create Publication-quality Graphics 
16.  **Code**: Derive Values from Raster Time Series 

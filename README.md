# Spacial Analysis 

<img src="Image/cover.png" width="140">

* This is a self-paced learning for R `sf` package that supports many kinds of spatial analysis.  
* See instructions [here](https://datacarpentry.org/geospatial-workshop/setup.html) to set up dependencies for `sf` package in R.
* For spatial analysis tutorials, visit [this](https://ucmerced.github.io/2021-03-22-ucmerced/) page.

## Set up spatial analysis programs 
* Install R. 
* Install RStudio. 
* Install `sf` package in RStudio.
* Install RTools (see [general instructions](https://datacarpentry.org/geospatial-workshop/setup.html) or simply download the pacakge [here](http://www.kyngchaos.com/software/frameworks/)), including: 
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

## :blue_book: Course Outline 
1. [Introduction to Raster Data](https://datacarpentry.org/organization-geospatial/01-intro-raster-data/index.html)  
2. [Coordinate Reference Systems](https://datacarpentry.org/organization-geospatial/03-crs/index.html)
3. [Introduction to Vector Data](https://datacarpentry.org/organization-geospatial/02-intro-vector-data/index.html)
4. [Open and Plot Shapefiles](https://datacarpentry.org/r-raster-vector-geospatial/06-vector-open-shapefile-in-r/index.html)
5. [Explore and Plot by Vector Layer Attributes](https://datacarpentry.org/r-raster-vector-geospatial/07-vector-shapefile-attributes-in-r/index.html)
6. [Handling Spatial Projection & CRS](https://datacarpentry.org/r-raster-vector-geospatial/09-vector-when-data-dont-line-up-crs/index.html)
7. [Convert from .csv to a Shapefile](https://datacarpentry.org/r-raster-vector-geospatial/10-vector-csv-to-shapefile-in-r/index.html)
8. [Manipulate Raster Data](https://datacarpentry.org/r-raster-vector-geospatial/11-vector-raster-integration/index.html)

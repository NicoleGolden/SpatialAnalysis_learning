# Spacial Analysis 

<img src="Image/cover.png" width="140">

* This is a self-paced learning for R `sf` package that supports many kinds of spatial analysis.  
* See instructions [here](https://datacarpentry.org/geospatial-workshop/setup.html) to set up dependencies for `sf` package in R.
* For spatial analysis tutorials, visit [short tutorial](https://ucmerced.github.io/2021-03-22-ucmerced/) or [long tutorial](https://datacarpentry.org/r-raster-vector-geospatial/)

## :wrench: Set up spatial analysis programs 
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

## :arrow_down: Download data 
* Download spatial data for this training [here](https://ndownloader.figshare.com/articles/2009586/versions/10).
* For an overview of the data, visit this [page](https://datacarpentry.org/geospatial-workshop/data/).

## :blue_book: Course Outline 
1. **Basics:** [Introduction to Raster Data](https://datacarpentry.org/organization-geospatial/01-intro-raster-data/index.html)  
2. **Basics:** [Coordinate Reference Systems](https://datacarpentry.org/organization-geospatial/03-crs/index.html)
3. **Basics:** [Introduction to Vector Data](https://datacarpentry.org/organization-geospatial/02-intro-vector-data/index.html)
4. **Code**: [Plot raster data](https://datacarpentry.org/r-raster-vector-geospatial/02-raster-plot/index.html)
5. **Code**: [Reproject Raster Data](https://datacarpentry.org/r-raster-vector-geospatial/03-raster-reproject-in-r/index.html)
6. **Code**: [Raster Calculations](https://datacarpentry.org/r-raster-vector-geospatial/04-raster-calculations-in-r/index.html)
7. **Code**: [Work With Multi-Band Rasters](https://datacarpentry.org/r-raster-vector-geospatial/05-raster-multi-band-in-r/index.html)
8. **Code**: [Open and Plot Shapefiles](https://datacarpentry.org/r-raster-vector-geospatial/06-vector-open-shapefile-in-r/index.html)
9. **Code**: [Explore and Plot by Vector Layer Attributes](https://datacarpentry.org/r-raster-vector-geospatial/07-vector-shapefile-attributes-in-r/index.html)
10. **Code**: [Plot Multiple Shapefiles](https://datacarpentry.org/r-raster-vector-geospatial/08-vector-plot-shapefiles-custom-legend/index.html)
11. **Code**: [Handling Spatial Projection & CRS](https://datacarpentry.org/r-raster-vector-geospatial/09-vector-when-data-dont-line-up-crs/index.html)
12. **Code**: [Convert from .csv to a Shapefile](https://datacarpentry.org/r-raster-vector-geospatial/10-vector-csv-to-shapefile-in-r/index.html)
13. **Code**: [Manipulate Raster Data](https://datacarpentry.org/r-raster-vector-geospatial/11-vector-raster-integration/index.html)
14. **Code**: [Raster Time Series Data](https://datacarpentry.org/r-raster-vector-geospatial/12-time-series-raster/index.html)
15. **Code**: [Create Publication-quality Graphics](https://datacarpentry.org/r-raster-vector-geospatial/13-plot-time-series-rasters-in-r/index.html)
16.  **Code**: [Derive Values from Raster Time Series](https://datacarpentry.org/r-raster-vector-geospatial/14-extract-ndvi-from-rasters-in-r/index.html)
# Makes color palettes from GRASS GIS 7.0 available in R.

Version 0.6.0 (2017-09-22) is ready to be tested: it appears to work, and has complete documentation.

The package contains GRASS GIS color tables in a form usable within R.

# Example usage

## Importing and displaying GIS palettes

To show the available palettes in data frame form:

```gis.pal.info()```


To display a single palette:

```display.gis.pal(name="wave")```

or all palettes, five at a time:

```display.gis.pals()```

To import a GRASS-styled color palette:

```samplepal <- read.gis.pal(text =
"0 black
10% yellow
78 blue
100% 0:255:230,
nv white")
display.gis.pal(pal=samplepal)```


Note that this ignores the nv no value color, as NA values are handled differently in R than GRASS.

## Configuring GIS palettes

Any existing palette can be configured for a particular data range (zlim) and number of colors.

```par(mfrow=c(5,1))
display.gis.pal(pal=gis.pal("gyr", n=3, zlim=c(0,1)))
display.gis.pal(pal=gis.pal("gyr", n=4, zlim=c(0,1)))
display.gis.pal(pal=gis.pal("gyr", n=5, zlim=c(0,1)))
display.gis.pal(pal=gis.pal("gyr", n=13, zlim=c(0,1)))
display.gis.pal(pal=gis.pal("gyr", n=28, zlim=c(0,1))) ```

The color column can be extracted from a palette data frame, or the palette can be used with gisimage() as a replacement for image().

### Simple example 1

```mat1 <- matrix(runif(100), 10, 10)
pal1 <- gis.pal("gyr", n=11, zlim=c(0,1))
pal1
gis.pal.info("gyr")
layout(matrix(c(1,1,1,2), ncol=1))
gisimage(mat1, pal1, legend=FALSE)
display.gis.pal(pal=pal1)```

### Simple example 2

Palettes do not have to be linear gradients.

```pal2 <- read.gis.pal(text =
"0 black
10% yellow
20% red
100% red")
layout(matrix(c(1,1,1,2), ncol=1))
gisimage(mat1, pal2, legend=FALSE)
display.gis.pal(pal=pal2)```

### divergent colors

```mat <- matrix(sample(seq(-5, 8), 100, replace=TRUE), 10, 10)
div.pal <- gis.pal("differences", n=11, zlim=c(-8, 8))
gisimage(mat, pal=div.pal, legend=FALSE)```  

### Spatial Grid Data Frame example
```library(sp)
data(meuse.grid)
coordinates(meuse.grid) <- ~x+y
gridded(meuse.grid) <- TRUE
fullgrid(meuse.grid) <- TRUE

par(mfrow=c(1, 2))
gisimage(meuse.grid, attr="dist", pal="wave", legend=FALSE)
gisimage(meuse.grid, attr="dist", pal=gis.pal("grey1.0", n=20), legend=FALSE)  ```

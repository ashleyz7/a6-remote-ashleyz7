### This is the stump script to read the data and plot the maps
### You have to write the code suggested here.
### Feel free to follow the ideas in a different manner/in a different file.
### However, you have to submit your main code file.
###
### The file must be executable on the server!
### I.e. someone else must be able to just run it with 'Rscript maps.R'
### /on server/ and get the correct output.

## setwd("~/Documents/INFO 201/a6-remote-ashleyz7")
library("ggplot2")
library("dplyr")
library("data.table")
library("mapproj")

## read the data
##
## hint1: figure out the correct format and use the correct function.
##
## hint2: read.table and friends are slow (about 6 min to read data).
## You may use data.table::fread instead (a few seconds)

data <- data.table::fread("pbzip2 -dc /opt/data/temp_prec_small.csv.bz2")
## data <- read.csv('temp_prec_small.csv', sep = "\t")

## filter out North American observations

North_America <- filter(data, latitude > 0 & latitude < 80)
data.1960 <- North_America %>% filter(time == "1960-07-01")
data.1987 <- North_America %>% filter(time == "1987-07-01")
data.2014 <- North_America %>% filter(time == "2014-07-01")

## delete the original (large data) from R workspace
## this is necessary to conserve memory.
## overwrite it with sth else "a"

data <- "a"

## -------------------- do the following for 1960, 1987, 2014 and temp/precipitation --------------------

## select jpg graphics device

## select the correct year - plot longitude-latitude and color according to the temp/prec variable
## I recommend to use ggplot() but you can use something else too.
## 
## Note: if using ggplot, you may want to add "+ coord_map()" at the end of the plot.  This
## makes the map scale to look better.  You can also pick a particular map projection, look
## the documentation.  (You need 'mapproj' library).
## Warning: map projections may be slow (several minutes per plot).

## close the device

PrecipitationMap <- function(this.data, year) {
  graph1 <- ggplot(data = this.data) + 
    geom_point(mapping = aes(x = longitude, y = latitude, col = precipitation)) +
    labs(title = paste0("Precipitation for July ", year)) +
    coord_map()
  return (graph1)
}

TemperatureMap <- function(this.data, year) {
  graph2 <- ggplot(data = this.data) + 
    geom_point(mapping = aes(x = longitude, y = latitude, col = airtemp)) +
    labs(title = paste0("Temperature for July ", year)) +
    coord_map()
  return(graph2)
}

jpeg(file ="Precipitation.1960.jpg", width = 500, height = 500)
PrecipitationMap(data.1960, "1960")
dev.off()

jpeg(file ="Precipitation.1987.jpg", width = 500, height = 500)
PrecipitationMap(data.1987, "1987")
dev.off()

jpeg(file ="Precipitation.2014.jpg", width = 500, height = 500)
PrecipitationMap(data.2014, "2014")
dev.off()

jpeg(file ="Temperature.1960.jpg", width = 500, height = 500)
TemperatureMap(data.1960, "1960")
dev.off()

jpeg(file ="Temperature.1987.jpg", width = 500, height = 500)
TemperatureMap(data.1987, "1987")
dev.off()

jpeg(file ="Temperature.2014.jpg", width = 500, height = 500)
TemperatureMap(data.2014, "2014")
dev.off()



## -------------------- you are done.  congrats :-) --------------------


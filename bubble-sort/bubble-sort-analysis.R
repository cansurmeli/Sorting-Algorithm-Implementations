# REQUIRED LIBRARIES
library(ggplot2)      # Create Elegant Data Visualisations Using the Grammar of Graphics
library(ggrepel)      # Automatically Position Non-Overlapping Text Labels with 'ggplot2'
library(rstudioapi)   # related to setting up the working directory
# library(ggalt)      # Extra Coordinate Systems, 'Geoms', Statistical Transformations,
                      # Scales and Fonts for 'ggplot2'

# GRUNT WORK
# Set and check the working directory
setwd(dirname(getActiveDocumentContext()$path))
getwd()

# PRE-PLOTTING GRUNT WORK
# Turn-off the scientific notation like 1e+48
options(scipen=999)

# Pre-set the BW theme
theme_set(theme_bw())

# DATA OPERATIONS
# Retrieve the data
bubbleSortResults <- read.csv("results-bubble-sort-numeric.csv")

# Crop the data set
# Otherwise there is too much data to display
# It gets highly noisy
firstNinetyRows <- 90
chunk <- sample(bubbleSortResults[1:firstNinetyRows,])
# View(chunk)

# Modularly controlling which data set gets displayed
dataSet <- bubbleSortResults
subSetData <- subset(dataSet, KnownNumberArrangement == 0)
mean(subSetData$SecondsElapsed, na.rm = TRUE)

# The usage of the data set
# Also related to making labelling below better for the eyes
numberCount <- dataSet$NumberCount
secondsElapsed <- dataSet$SecondsElapsed
knownNumberArrangement <- dataSet$KnownNumberArrangement

# PLOT IT...
ggplot(dataSet, aes(x = numberCount, 
										y = secondsElapsed)) + 
	# request a scatterplot
	geom_point(aes(col = knownNumberArrangement), 
						 size = 3) + 
	# add a smoothing layer
	# the line of the best fit
	geom_smooth(method = "loess", 
							col = "steelblue", 
							size = 1) +
	# counts chart / overcoming the problem of data points that overlap
	geom_count(col = "tomato3") +		                                              
	ggtitle("BUBBLE SORT in C", 
					subtitle = "Number Count vs. Seconds Elapsed") +
	xlab("Number Count") +
	ylab("Seconds Elapsed") +
	scale_x_continuous(breaks = seq(10000, 100000, 10000)) +
	scale_y_continuous(breaks = seq(0, 80, 5))
# add labelling to the data points
# geom_text_repel(aes(label = knownNumberArrangement), size = 2, data = dataSet)
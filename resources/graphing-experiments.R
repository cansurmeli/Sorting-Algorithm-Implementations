# REQUIRED LIBRARIES
library(ggplot2)   # a popular graphics framework



# GRUNT WORK
# Make it  more readable
projectLocation <- "/Users/can/Documents/Family/Can/Master/
University Passau/
Semesters/
WS 19:20/
Empirical Methods for Software Engineering/
EMSE | Exercise/
EMSE | Exercise 3/
Sorting\ Algorithm\ Implementations/
bubble-sort"

# The above multi-line style needs the removal of new-line characters
directory <- gsub("\n", "", projectLocation)

# Set and check the working directory
setwd(directory)
getwd()



# PRE-PLOTTING GRUNT WORK
# Turn-off the scientific notation like 1e+48
options(scipen=999)

# Pre-set the BW theme
theme_set(theme_bw())



# THE ACTION
# Retrieve the data
bubbleSortResults <- read.csv("results-bubble-sort.csv")

# Crop the data set
# Otherwise there is too much data to display
# It gets highly noisy
firstNinetyRows <- 90
chunk <- sample(bubbleSortResults[1:firstNinetyRows,])
# View(chunk)

# Modularly controlling which data set gets displayed
dataSet <- bubbleSortResults

# The usage of the data set
# Also related to making labelling down the line easier to the eyes
numberCount <- dataSet$NumberCount
secondsElapsed <- dataSet$SecondsElapsed

# Tell GGPlot to:
# - what dataset to use,
# - x and y coordinates.
# Therefore graph drawn will be empty
baseGraph <- ggplot(dataSet, aes(x = numberCount, 
										y = secondsElapsed))

# Tell GGPlot that a scatter plot is wanted
scatterPlot <- baseGraph + geom_point()

# Add a smoothing layer
# lm: linear model
smoothingLayer <- scatterPlot + geom_smooth(method = "lm")

# Delete the points outside of the defined range
# c: vector
deletePointsOutsideRange <- smoothingLayer +
	xlim(c(0, 0.1)) +
	ylim(c(0, 1000000))

# Zoom-in on the data
zoomIn <- smoothingLayer + coord_cartesian(xlim = (c(0, 0.1)), ylim = (c(0, 1000000)))
	
# Add labelling
labelling <- zoomIn + 
	ggtitle("BUBBLE SORT", subtitle = "Seconds Elapsed vs. Number Count") +
	xlab("Seconds Elapsed") +
	ylab("Number Count")

# Change the styling
# Aesthetics of the geom layer
# Set the colour and the size of the points
# Change the colour of the line
ggplot(dataSet, aes(x = numberCount, y = secondsElapsed)) + 
	geom_point(col = "steelblue", size = 3) +
	geom_smooth(method = "lm", col = "firebrick") +
	ggtitle("BUBBLE SORT", subtitle = "Seconds Elapsed vs. Number Count") +
	xlab("Seconds Elapsed") +
	ylab("Number Count")

# Add categories based on the number count
ggplot(dataSet, aes(x = numberCount, y = secondsElapsed)) + 
	geom_point(aes(col = numberCount), size = 4) +
	geom_smooth(method = "lm", col = "firebrick", size = 1) +
	ggtitle("BUBBLE SORT", subtitle = "Seconds Elapsed vs. Number Count") +
	xlab("Seconds Elapsed") +
	ylab("Number Count")

# Change the colour palette
ggplot(dataSet, aes(x = numberCount, y = secondsElapsed)) + 
	geom_point(aes(col = numberCount), size = 4) +
	geom_smooth(method = "lm", col = "firebrick", size = 1) +
	ggtitle("BUBBLE SORT", subtitle = "Seconds Elapsed vs. Number Count") +
	xlab("Seconds Elapsed") +
	ylab("Number Count") +
	scale_colour_brewer(palette = "Set1")

# Change the scale breaks of the x and y coordinates
ggplot(dataSet, aes(x = numberCount, y = secondsElapsed)) + 
	geom_point(aes(col = numberCount), size = 3) +
	geom_smooth(method = "lm", col = "firebrick", size = 1) +
	ggtitle("BUBBLE SORT", subtitle = "Seconds Elapsed vs. Number Count") +
	xlab("Seconds Elapsed") +
	ylab("Number Count") +
	scale_x_continuous(breaks = seq(0, 10000, 1000)) +
	scale_y_continuous( breaks = seq(0, 0.5, 0.05))

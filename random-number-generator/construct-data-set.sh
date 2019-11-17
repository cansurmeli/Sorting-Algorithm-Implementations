#!/bin/bash

source printStatusMessage.sh
source printNewLine.sh
source printErrorMessage.sh

# The count of generation for each file set
# - [generationCount] files containing hundred numbers each
# - [generationCount] files containing thousand numbers each
# - [generationCount] files containing ten thousand numbers each
generationCount=100

# Start generating files with 100 random numbers
counter=0

until [ $counter -eq $generationCount ]
do
	fileName="100-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n 100
	printStatusMessage "Generated ${counter}. file with 100 numbers."
	((counter++))
done

# Start generating files with 1K random numbers
counter=0

until [ $counter -eq $generationCount ]
do
	fileName="1000-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n 1000
	printStatusMessage "Generated ${counter}. file with 1000 numbers."
	((counter++))
done

# Start generating files with 10K random numbers
counter=0

until [ $counter -eq $generationCount ]
do
	fileName="10000-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n 10000
	printStatusMessage "Generated ${counter}. file with 10,000 numbers."
	((counter++))
done

# move the files
mkdir data-set
mv *.txt data-set/

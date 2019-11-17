#!/bin/bash

# The count of generation for each file set
# - [generationCount] files containing hundred numbers
# - [generationCount] files containing thousand numbers
# - [generationCount] files containing ten thousand numbers
generationCount=100

# Go to the appropiate directory
cd ../random-number-generator

# Start generating files with 100 random numbers
counter=0

until [ $counter -eq $generationCount ]
do
	#bash ../random-number-generator/initiate.sh -f "100-numbers-"$counter -n 100
	./initiate.sh -f "100-numbers-"$counter -n 100
	((counter++))
done

# Start generating files with 1K random numbers
counter=0

until [ $counter -eq $generationCount ]
do
	./initiate.sh -f "1000-numbers-"$counter -n 1000
	((counter++))
done

# Start generating files with 10K random numbers
counter=0

until [ $counter -eq $generationCount ]
do
	./initiate.sh -f "10000-numbers-"$counter -n 10000
	((counter++))
done

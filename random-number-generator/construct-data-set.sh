#!/bin/bash

source printStatusMessage.sh
source printNewLine.sh
source printErrorMessage.sh

# The count of generation for each file set
# - [generationCount] files containing hundred numbers each
# - [generationCount] files containing thousand numbers each
# - [generationCount] files containing ten thousand numbers each
generationCount=30


# Generating...
counter=0
numberCount=10000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done


# Generating...
counter=0
numberCount=20000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done

# Generating...
counter=0
numberCount=30000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done

# Generating...
counter=0
numberCount=40000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done

# Generating...
counter=0
numberCount=50000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done


# Generating...
counter=0
numberCount=60000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done


# Generating...
counter=0
numberCount=70000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done

# Generating...
counter=0
numberCount=80000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done

# Generating...
counter=0
numberCount=90000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done

# Generating...
counter=0
numberCount=100000

until [ $counter -eq $generationCount ]
do
	fileName="${numberCount}-numbers-"$counter
	./initiateRandomNumberFileSetGeneration.sh -f $fileName -n $numberCount
	printStatusMessage "Generated ${counter}. file with ${numberCount} numbers."
	((counter++))
done

# move the files
mkdir data-set
mv *.txt data-set/

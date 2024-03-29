#!/bin/bash

# Start the sorting
for file in ../dataset/*.txt
do
	numberCount="$(wc -l < $file)"
	numberCount=$((numberCount+1))

	echo $file
	./bubble-sort $file $numberCount
	echo ""
done

# Combine the generated CSV files into one
cd ../dataset
cat *.csv >results-bubble-sort.csv
mv results-bubble-sort.csv ../bubble-sort
rm *.csv

# Add a header to the merged CSV file for identification purposes
cd ../bubble-sort
echo 'FileName, KnownNumberArrangement, SecondsElapsed, NumberCount, OperationCount\n' > temp_file.csv
cat results-bubble-sort.csv >> temp_file.csv
mv temp_file.csv results-bubble-sort.csv

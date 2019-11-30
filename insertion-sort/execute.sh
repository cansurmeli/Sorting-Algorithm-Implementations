#!/bin/bash

# Start the sorting
for file in ../data-set/*.txt
do
	numberCount="$(wc -l < $file)"
	numberCount=$((numberCount+1))

	echo $file
	./insertion-sort $file $numberCount
	echo ""
done

# Combine the generated CSV files into one
cd ../data-set
cat *.csv >results-insertion-sort.csv
mv results-insertion-sort.csv ../insertion-sort
rm *.csv

# Add a header to the merged CSV file for identification purposes
cd ../insertion-sort
echo 'FileName, KnownNumberArrangement, SecondsElapsed, NumberCount, OperationCount\n' > temp_file.csv
cat results-insertion-sort.csv >> temp_file.csv
mv temp_file.csv results-insertion-sort.csv

cd data-set

# Analyse every file in the data set
for file in *.txt
do
	# get the number count / one line = one number
	numberCount="$(wc -l < $file)"

	# increment the count by one because wc
	# starts from 0
	numberCount=$((numberCount+1))

	# retrieve the performance analysis of running
	# the Haskell program
	#output="$(time ./merge-sort $file)"
	(time ./merge-sort $file) 2> $file.results

	# process the analysis results
	#array=( $output )
	#echo ${a[1]}

	# write to CSV
done

# Merge the CSV results
cat *.csv >results-merge-sort.csv
mv results-merge-sort.csv ../
rm *.csv

# Add a header to the general results file
cd ../
echo 'FileName, KnownNumberArrangement, SecondsElapsed, NumberCount, OperationCount\n' > temp_file.csv
cat results-bubble-sort.csv >> temp_file.csv
mv temp_file.csv results-bubble-sort.csv

# Analyse every file in the data set
for file in data-set/*.txt
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

	echo $file
	secondsElapsed=`tail -1 $file.results | awk '{print $2}'`
	echo $secondsElapsed
	#knownNumberArrangement=`echo $file | cut -d'-' -f6 | cut -d'.' -f1`
	if [[ "$file" == *"ascending"* ]]; then
		knownNumberArrangement="ascending"
	elif [[ "$file" == *"descending"* ]]; then
		knownNumberArrangement="descending"
	else
		knownNumberArrangement="unordered"
	fi
	echo ""

	echo "$file, ${knownNumberArrangement}, ${secondsElapsed}, ${numberCount}" > $file.csv
	rm $file.results
done

# Merge the CSV results
cd data-set
cat *.csv >results-merge-sort.csv
mv results-merge-sort.csv ../
rm *.csv

# Add a header to the general results file
cd ../
echo 'FileName, KnownNumberArrangement, SecondsElapsed, NumberCount\n' > temp_file.csv
cat results-merge-sort.csv >> temp_file.csv
mv temp_file.csv results-merge-sort.csv

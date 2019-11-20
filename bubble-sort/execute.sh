# Start sorting
for file in data-set/*.txt
do
	numberCount="$(wc -l < $file)"
	numberCount=$((numberCount+1))

	echo $file
	./bubble-sort $file $numberCount
	echo ""
done

# Start prepping the sorting results
# Combine the generated CSV files into one so that it can be analysed in R
cd data-set
cat *.csv >results-bubble-sort.csv
mv results-bubble-sort.csv ../
rm *.csv

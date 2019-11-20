# Start sorting
for file in data-set/*.txt
do
	numberCount="$(wc -l < $file)"
	numberCount=$((numberCount+1))

	echo $file
	./insertion-sort $file $numberCount
	echo ""
done

# Start prepping the sorting results
# Combine the generated CSV files into one so that it can be analysed in R
cd data-set
cat *.csv >results-insertion-sort.csv
mv results-insertion-sort.csv ../
rm *.csv

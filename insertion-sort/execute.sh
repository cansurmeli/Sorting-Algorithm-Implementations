for file in data-set/*.txt
do
	numberCount="$(wc -l < $file)"
	numberCount=$((numberCount+1))

	./insertion-sort $file $numberCount
done

cd data-set
mkdir results-insertion-sort
mv *.csv results-insertion-sort
cd results-insertion-sort
mv 100-numbers-0-unordered.txt.csv 100-numbers-0-unordered.txt.csv.temp
for file in *.csv
do
	tail -n +2 "$file" > "$file.tmp" && mv "$file.tmp" "$file"
	echo >> $file
done
mv 100-numbers-0-unordered.txt.csv.temp 100-numbers-0-unordered.txt.csv
cat *.csv >merged.csv

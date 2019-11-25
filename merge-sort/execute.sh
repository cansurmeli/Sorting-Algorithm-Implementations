mkdir data-set/results-merge-sort

for file in data-set/*.txt
do
	numberCount="$(wc -l < $file)"
	numberCount=$((numberCount+1))

	output="$(time ./merge-sort $file)"
	#echo $output
	array=( $output )
	#echo ${a[1]}
done

cd data-set/results-merge-sort
#mv 100-numbers-0-unordered.txt.csv 100-numbers-0-unordered.txt.csv.temp
#for file in *.csv
#do
	#tail -n +2 "$file" > "$file.tmp" && mv "$file.tmp" "$file"
	#echo >> $file
#done
#mv 100-numbers-0-unordered.txt.csv.temp 100-numbers-0-unordered.txt.csv
cat *.csv >merged.csv

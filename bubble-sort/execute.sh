cd data-set

for file in *.txt
do
	cd data-set
	numberCount="$(wc -l < $file)"
	numberCount=$((numberCount+1))
	cd ../
	./bubble file $numberCount
done

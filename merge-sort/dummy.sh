#output="$(time ./merge-sort data-set/1000-numbers-10-unordered.txt)"
time ./merge-sort data-set/1000-numbers-10-unordered.txt >> output.txt
#echo $output
array=( $output )
#echo ${a[1]}

generateRandomNumbersToFileAsUnordered() {
	#printStatusMessage "Started generating random numbers."

	counter=1

	until [ $counter -eq $NUMBER_COUNT ]
	do
		echo $RANDOM >> $FILE_NAME-unordered.txt
		((counter++))
	done

	#printStatusMessage "Finished generating random numbers."
}

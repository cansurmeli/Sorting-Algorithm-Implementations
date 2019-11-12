#!/bin/bash

COMMAND_LINE_ARGUMENTS=$@

parseCommandLineArguments() {
	POSITIONAL=()
	while [[ $# -gt 0 ]]
	do
		key="$1"

		case $key in
				-o|--output)
				OUTPUT_LOCATION="$2"
				echo "output"
				echo $OUTPUT_LOCATION
				shift												# past argument
				shift												# past value
				;;
				-n|--numberCount)
				echo "numberCount"
				NUMBER_COUNT="$2"
				echo $NUMBER_COUNT
				shift												# past argument
				shift												# past value
				;;
				-v|--verbose)
				IS_VERBOSE=true
				shift												# past argument
				;;
				--default)
				DEFAULT=YES
				shift												# past argument
				;;
				*)													# unknown option
				POSITIONAL+=("$1")					# save it in an array for later
				shift												# past argument
				;;
		esac
	done
	set -- "${POSITIONAL[@]}"					# restore positional parameters
}

generateRandomNumbers() {
	parseCommandLineArguments "$COMMAND_LINE_ARGUMENTS"
	#echo $OUTPUT_LOCATION
	#echo $NUMBER_COUNT
	#echo $IS_VERBOSE
}

generateRandomNumbers

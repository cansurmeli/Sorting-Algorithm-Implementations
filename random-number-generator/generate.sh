#!/bin/bash

COMMAND_LINE_ARGUMENTS=$@

generateRandomNumbers() {
	parseCommandLineArguments "$COMMAND_LINE_ARGUMENTS"
	#echo $OUTPUT_LOCATION
	#echo $NUMBER_COUNT
	#echo $IS_VERBOSE
}

generateRandomNumbers

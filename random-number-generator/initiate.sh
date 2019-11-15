#!/bin/bash

source generateRandomNumbersToFileAsUnordered.sh
source parseCommandLineArguments.sh
source printNewLine.sh
source printErrorMessage.sh
source printStatusMessage.sh
source printWarningMessage.sh
source writeToFileAsOrderedAscending.sh
source writeToFileAsOrderedDescending.sh

COMMAND_LINE_ARGUMENTS=$@

main() {
	parseCommandLineArguments "$COMMAND_LINE_ARGUMENTS"
	generateRandomNumbers
	writeToFileAsOrderedAscending
	writeToFileAsOrderedDescending
}

main

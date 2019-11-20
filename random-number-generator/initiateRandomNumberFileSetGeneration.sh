#!/bin/bash

source generateRandomNumbersToFileAsUnordered.sh
source parseCommandLineArguments.sh
source printNewLine.sh
source printErrorMessage.sh
source printStatusMessage.sh
source printWarningMessage.sh
source writeToFileAsOrderedAscending.sh
source writeToFileAsOrderedDescending.sh

#COMMAND_LINE_ARGUMENTS=$@

POSITIONAL=()
while [[ $# -gt 0 ]]
do
	key="$1"

	case $key in
			-h|--help)
			HELP="$2"
			less "help.txt"
			exit 0											# as expected, display the help and exit
			shift												# past argument
			;;
			-f|--file)
			FILE_NAME="$2"
			shift												# past argument
			shift												# past value
			;;
			-n|--number)
			NUMBER_COUNT="$2"
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

################################################################################
# Initiates the generation of a file set of three:
#  - an unordered file with random numbers,
#  - the above file sorted in ascending order,
#  - the above file flipped to be descending.
# Globals:
#   [TODO:var-name]
# Arguments:
#   $1: [TODO:description]
# Returns:
#   [TODO:description]
################################################################################
initiateRandomNumberFileSetGeneration() {
	#parseCommandLineArguments "$COMMAND_LINE_ARGUMENTS"
	generateRandomNumbersToFileAsUnordered
	writeToFileAsOrderedAscending
	writeToFileAsOrderedDescending
}

initiateRandomNumberFileSetGeneration

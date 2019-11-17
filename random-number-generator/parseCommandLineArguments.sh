parseCommandLineArguments() {
	POSITIONAL=()
	while [[ $# -gt 0 ]]
	do
		key="$1"

		echo $2
		case $key in
				#-h|--help)
				#HELP="$2"
				#less "help.txt"
				#exit 0											# as expected, display the help and exit
				#shift												# past argument
				#;;
				-f|--file)
				echo "file"
				FILE_NAME="$2"
				echo $FILE_NAME
				shift												# past argument
				shift												# past value
				;;
				-n|--number)
				echo "number"
				NUMBER_COUNT="$2"
				echo $NUMBER_COUNT
				shift												# past argument
				shift												# past value
				;;
				-v|--verbose)
				echo "verbose"
				IS_VERBOSE=true
				shift												# past argument
				;;
				--default)
				echo "default"
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

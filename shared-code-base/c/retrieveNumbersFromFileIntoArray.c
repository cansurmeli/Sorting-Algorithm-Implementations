/*Retrieves the numbers in a given text file and returns the numbers in an array.*/
int * retrieveNumbersFromFileIntoArray(char fileName[]) {
	FILE *file = fopen(fileName, "r");
	char *fileLine = NULL;
	size_t len = 0;
	ssize_t read;
	static int numbers[100000];
	int numberIndex= 0;

	// check if the file exists
	if (file == NULL) {
		printf("Could not open the file!\n");
		return 0;
	}

	// retieve the file contents
	do {
		read = getline(&fileLine, &len, file);
		numbers[numberIndex] = atoi(fileLine);
		numberIndex++;
	} while(read != -1);

	return numbers;
}

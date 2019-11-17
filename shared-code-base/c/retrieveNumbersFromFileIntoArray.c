/*Retrieves the numbers in a given text file and returns the numbers in an array.*/
void retrieveNumbersFromFileIntoArray(char fileName[], int *numbers) {
	FILE *file = fopen(fileName, "r");
	char *fileLine = NULL;
	size_t len = 0;
	ssize_t read;
	int numberIndex= 0;

	// check if the file exists
	if (file == NULL) {
		printf("Could not open the file!\n");

		return;
	}

	printf("Started with retrieving the numbers from the text file.\n");

	// retieve the file contents
	do {
		read = getline(&fileLine, &len, file);
		numbers[numberIndex] = atoi(fileLine);
		numberIndex++;
	} while(read != -1);

	printf("Ended with retrieving the numbers from the text file.\n");
}

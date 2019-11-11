#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

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

void insertionSort(int array[], int n) {
	int i, key, j;

	for ( i = 1; i < n; i++) {
		key = array[i];
		j = i - 1;

		while (j >= 0 && array[j] > key) {
			array[j + 1] = array[j];
			j = j - 1;
		}

		array[j + 1] = key;
	}
}

void printArray(int array[], int n) {
	int i;

	for (i=0; i < n; i++) {
		printf("%d\n", array[i]);
	}
}

int main(int argc, char* argv[]) {
	char *fileName;
	int *numbers;
	int numberCount;
	clock_t start, end;
	float secondsElapsed;

	// parse the command line arguments
	fileName = argv[1];
	numberCount = atoi(argv[2]);

	numbers = retrieveNumbersFromFileIntoArray(fileName);

	start = clock();
	insertionSort(numbers, numberCount);
	end = clock();

	secondsElapsed = (float)(end - start) / CLOCKS_PER_SEC;
	printf("TIME ELAPSED: %.6f\n", secondsElapsed);

	/*printf("SORTED ARRAY:\n");*/
	/*printArray(numbers, numberCount);*/

	return 0;
}

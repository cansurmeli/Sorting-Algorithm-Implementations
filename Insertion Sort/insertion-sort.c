#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include "../shared-code-base/c/generateCSVFile.c"
#include "../shared-code-base/c/printArray.c"
#include "../shared-code-base/c/retrieveNumbersFromFileIntoArray.c"

void insertionSort(int array[], int n, int *operationCount) {
	int i, key, j;

	printf("Started with the insertion sort.\n");

	for ( i = 1; i < n; i++) {
		key = array[i];
		j = i - 1;

		while (j >= 0 && array[j] > key) {
			array[j + 1] = array[j];
			j = j - 1;
			(*operationCount)++;
		}

		array[j + 1] = key;
	}
	
	printf("Ended with the insertion sort.\n");
}

int main(int argc, char* argv[]) {
	char *fileName;
	int numberCount,
			operationCount = 0;
	clock_t start, end;
	float secondsElapsed;

	// retrieve the file name from the command line
	fileName = argv[1];

	// retrieve the number count from the command line
	numberCount = atoi(argv[2]);

	// Generate an array based on the given number count
	int numbers[numberCount];

	retrieveNumbersFromFileIntoArray(fileName, numbers);

	start = clock();
	insertionSort(numbers, numberCount, &operationCount);
	end = clock();

	secondsElapsed = (float)(end - start) / CLOCKS_PER_SEC;
	printf("TIME ELAPSED: %.6f\n", secondsElapsed);

	generateCSVFile(fileName, secondsElapsed, numberCount, operationCount);

	/*printf("SORTED ARRAY:\n");*/
	/*printArray(numbers, numberCount);*/

	return 0;
}

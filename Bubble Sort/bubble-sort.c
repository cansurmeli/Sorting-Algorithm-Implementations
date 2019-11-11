#include <stdio.h>
#include <string.h>
#include <time.h>
#include <stdlib.h>

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

void swap(int *a, int *b) {
	int temp = *a;
	*a = *b;
	*b = temp;
}

void bubbleSort(int array[], int n) {
	int i, j;

	for (i = 0; i < n-1; i++) {
		for (j = 0; j < n-i-1; j++) {
			if (array[j] > array[j+1]) {
				swap(&array[j], &array[j+1]);
			}
		}
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

	/*int n = sizeof(&numbers) / sizeof(numbers[0]);*/
	/*printf("%d", n);*/

	start = clock();
	bubbleSort(numbers, numberCount);
	end = clock();

	secondsElapsed = (float)(end - start) / CLOCKS_PER_SEC;
	printf("TIME ELAPSED: %.6f\n", secondsElapsed);

	/*printf("SORTED ARRAY:\n");*/
	/*printArray(numbers, numberCount);*/

	return 0;
}

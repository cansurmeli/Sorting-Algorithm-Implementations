#include <stdio.h>
#include <string.h>
#include <time.h>
#include <stdlib.h>

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

int main(int argc, char* argv[]) {
	char *fileName;
	int *numbers, numberCount;
	clock_t start, end;
	float secondsElapsed;

	// retrieve the file name from the command line
	fileName = argv[1];

	numbers = retrieveNumbersFromFileIntoArray(fileName);

	/*numberCount = sizeof(&numbers) / sizeof(numbers[0]);*/
	numberCount = sizeof(&numbers) / sizeof(*numbers);
	printf("%d", numberCount);

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

#include <stdio.h>
#include <string.h>
#include <time.h>

#define LSIZ 128
#define RSIZ 10

void retrieveContentsFromFileIntoArray(char fileName[]) {
	char lineContent[RSIZ][LSIZ];
	int i = 0;
	FILE *numbersFile = fopen(fileName, "r");

	printf("starting reading");

	while(fgets(lineContent[i], LSIZ, numbersFile)) {
		lineContent[i][strlen(lineContent[i]) - 1] = '\0';
		i++;
	}
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
		printf("%d ", array[i]);
	}
}

int main(int argc, char* argv[]) {
	/*retrieveContentsFromFileIntoArray("test.txt");*/

	int array[] = {64, 34, 25, 12, 22, 11, 90};
	int n = sizeof(array) / sizeof(array[0]);
	clock_t start, end;
	float secondsElapsed;

	start = clock();
	bubbleSort(array, n);
	end = clock();

	secondsElapsed = (float)(end - start) / CLOCKS_PER_SEC;
	printf("TIME ELAPSED: %.6f\n", secondsElapsed);

	printf("SORTED ARRAY:\n");
	printArray(array, n);

	return 0;
}

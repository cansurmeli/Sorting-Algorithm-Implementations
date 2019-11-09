#include <math.h>
#include <stdio.h>
#include <time.h>

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
		printf("%d ", array[i]);
	}
}

int main() {
	int array[] = { 12, 11, 13, 5, 6 };
	int n = sizeof(array) / sizeof(array[0]);
	clock_t start, end;
	float secondsElapsed;

	start = clock();
	insertionSort(array, n);
	end = clock();

	secondsElapsed = (float)(end - start) / CLOCKS_PER_SEC;
	printf("TIME ELAPSED: %.6f\n", secondsElapsed);

	printf("SORTED ARRAY:\n");
	printArray(array, n);

	return 0;
}

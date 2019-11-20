#include "../shared-code-base/c/generateCSVFile.c"
#include "../shared-code-base/c/printArray.c"
#include "../shared-code-base/c/retrieveNumbersFromFileIntoArray.c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void swap(int *a, int *b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}

void bubbleSort(int array[], int arrayItemCount, int *operationCount) {
  int i, j;

  printf("Started with the bubble sort.\n");

  for (i = 0; i < arrayItemCount - 1; i++) {
    for (j = 0; j < arrayItemCount - i - 1; j++) {
      if (array[j] > array[j + 1]) {
        swap(&array[j], &array[j + 1]);
        (*operationCount)++;
      }
    }
  }

  printf("Finished with the bubble sort.\n");
}

int main(int argc, char *argv[]) {
  char *fileName;
  int numberCount, operationCount = 0;
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
  bubbleSort(numbers, numberCount, &operationCount);
  end = clock();

  secondsElapsed = (float)(end - start) / CLOCKS_PER_SEC;
  printf("TIME ELAPSED: %.6f\n", secondsElapsed);

  generateCSVFile(fileName, secondsElapsed, numberCount, operationCount);

  /*printf("SORTED ARRAY:\n");*/
  /*printArray(numbers, numberCount, 1);*/

  return 0;
}

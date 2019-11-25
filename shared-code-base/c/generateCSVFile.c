#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void generateCSVFile(char fileName[], float secondsElapsed, int numberCount,
                     int operationCount) {
  FILE *csvFile;
  char knownNumberArrangement[16];

  csvFile = fopen(strcat(fileName, ".csv"), "w+");

  /*fprintf(csvFile, "File Name, Seconds Elapsed, Number Count, Operation
   * Count\n");*/

  if (strstr(fileName, "ascending") != NULL) {
    strcpy(knownNumberArrangement, "ascending");
  } else if (strstr(fileName, "descending") != NULL) {
    strcpy(knownNumberArrangement, "descending");
  } else {
    strcpy(knownNumberArrangement, "unordered");
  }

  fprintf(csvFile, "%s, %s, %f,%d,%d\n", fileName, knownNumberArrangement,
          secondsElapsed, numberCount, operationCount);

  fclose(csvFile);

  /*printf("Generated a CSV file for the results.\n");*/
}

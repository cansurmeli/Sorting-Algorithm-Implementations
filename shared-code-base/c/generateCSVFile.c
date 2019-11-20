#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void generateCSVFile(char fileName[], float secondsElapsed, int numberCount,
                     int operationCount) {
  FILE *csvFile;

  csvFile = fopen(strcat(fileName, ".csv"), "w+");

  /*fprintf(csvFile, "File Name, Seconds Elapsed, Number Count, Operation
   * Count\n");*/

  fprintf(csvFile, "%s, %f,%d,%d\n", fileName, secondsElapsed, numberCount,
          operationCount);

  fclose(csvFile);

  /*printf("Generated a CSV file for the results.\n");*/
}

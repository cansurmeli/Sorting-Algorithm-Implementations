void generateCSVFile(char fileName[], float secondsElapsed, int numberCount, int operationCount) {
	FILE *csvFile;

	csvFile = fopen(strcat(fileName, ".csv"), "w+");

	fprintf(csvFile, "Seconds Elapsed, Number Count, Operation Count\n");

	fprintf(csvFile, "%f,%d,%d", secondsElapsed, numberCount, operationCount);

	fclose(csvFile);

	printf("Generated a CSV file for the results.\n");
}

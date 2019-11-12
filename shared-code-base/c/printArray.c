void printArray(int array[], int isLinear) {
	int arrayIndex,
			columnCount = 20;

	for (arrayIndex = 0 ; arrayIndex < arrayCount ; arrayIndex++) {
		printf("%d", array[i]);

		// constructing a matrix
		if isLinear == 0 {
			printf("\t");
			if (arrayIndex % columnCount == 0 ) {
				printf("\n");
			}
		// constructing a linear list
		} else if isLinear == 1 {
			printf("\n");
		}
	}
}

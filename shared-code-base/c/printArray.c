void printArray(int array[], int arrayItemCount, int isLinear) {
	int index,
			columnCount = 20;

	for (index = 0 ; index < arrayItemCount ; index++) {
		printf("%d", array[index]);

		// constructing a matrix
		if (isLinear == 0) {
			printf("\t");
			if (index % columnCount == 0 ) {
				printf("\n");
			}
		// constructing a linear list
		} else if (isLinear == 1) {
			printf("\n");
		}
	}
}

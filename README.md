# Sorting Algorithm Implementations

## Beforehand

- **Not to forget** that running a Haskell program in `GHCI` will result in poorer performance as `GHCI` is an interpreter.
- Performance measurement for Haskell code in `GHCI`: `:set +s`

## Random Number Generator

- Run `./construct-data-set.sh` to generate a data set composed of:
	- random numbers,
		- [FILE_COUNT] x 100 numbers
		- [FILE_COUNT] x 1000 numbers
		- [FILE_COUNT] x 10000 numbers
	- it's ascending version,
	- it's descending version.
- Afterwards, the generated `data-set` file has to be copied into each and every one of the sorting algorithm implementations.

## Bubble Sort

- **implemented in:** C
- Run `./execute.sh` to apply bubble sort on the `data-set`.

## Insertion Sort

- **implemented in:** C
- Run `./execute.sh` to apply insertion sort on the `data-set`.

## Merge Sort

- **implemented in:** Haskell
- Running `time ./merge-sort data-set/1000-numbers-unordered.txt` will output some data regarding the execution.

## Quick Sort

- **implemented in:** Haskell
- Running `time ./quick-sort data-set/1000-numbers-unordered.txt` will output some data regarding the execution.

## Resources

- [Merge and Quick Sort in Haskell](https://smthngsmwhr.wordpress.com/2012/11/09/sorting-algorithms-in-haskell/)
- https://alvinalexander.com/haskell/how-to-use-command-line-arguments-in-haskell
- https://www.devdungeon.com/content/command-line-arguments-haskell
- https://stackoverflow.com/questions/3501338/c-read-file-line-by-line#3501681
- https://0xax.github.io/haskel-execution-time/
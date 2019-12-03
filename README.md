# Sorting Algorithm Implementations

## Beforehand

- **Not to forget** if you run a Haskell program in `GHCI`, it will result in a substandard performance as `GHCI` is an interpreter.
- If still you want to see the performance of a Haskell algorithm in `GHCI`, type `:set +s` before executing the algorithm.

## Pseudo Random Number Generator

This project makes use of a custom build PRNG as a submodule to generate the required dataset for the sorting algorithms.

The dataset is already there in the project root folder for common usage by all of the algorithms but if one wants a new one:

- `cd prng`
- `./00-construct-data-set.sh`

For more details, refer to the documentation in the `pong` folder.

## Bubble Sort

- **implemented in:** C
- Run `./execute.sh` to apply bubble sort on the `dataset`.
- When the script finishes, the results will be in the `bubble-sort` folder as a CSV file, ready for analysis in R.

## Insertion Sort

- **implemented in:** C
- Run `./execute.sh` to apply insertion sort on the `dataset`.
- When the script finishes, the results will be in the `insertion-sort` folder as a CSV file, ready for analysis in R.

## Merge Sort

- **implemented in:** Haskell
- Run `./execute.sh` to apply merge sort on the `dataset`.
- When the script finishes, the results will be in the `merge-sort` folder as a CSV file, ready for analysis in R.

## Quick Sort

- **implemented in:** Haskell
- Run `./execute.sh` to apply quick sort on the `dataset`.
- When the script finishes, the results will be in the `quick-sort` folder as a CSV file, ready for analysis in R.

## Resources

- [Merge and Quick Sort in Haskell](https://smthngsmwhr.wordpress.com/2012/11/09/sorting-algorithms-in-haskell/)
- https://alvinalexander.com/haskell/how-to-use-command-line-arguments-in-haskell
- https://www.devdungeon.com/content/command-line-arguments-haskell
- https://stackoverflow.com/questions/3501338/c-read-file-line-by-line#3501681
- https://0xax.github.io/haskel-execution-time/
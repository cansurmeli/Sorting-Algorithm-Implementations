import System.Environment
import System.IO

splitInHalf :: [a] -> ([a], [a])
splitInHalf xs = (take n xs, drop n xs)
  where n = (length xs) `div` 2

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] xs = xs
merge xs [] = xs
merge (x:xs) (y:ys)
  | (x < y) = x:merge xs (y:ys)
  | otherwise = y:merge (x:xs) ys

mergeSort :: (Ord a) => [a] -> [a]
mergeSort xs
  | (length xs) > 1 = merge (mergeSort leftSide) (mergeSort rightSide)
  | otherwise = xs
  where (leftSide, rightSide) = splitInHalf xs

main = do
  arguments <- getArgs
  let fileName = head arguments
  file <- openFile fileName ReadMode
  fileContents <- hGetContents file
  let numbers = map read $ words fileContents
  mergeSort numbers
  hClose file

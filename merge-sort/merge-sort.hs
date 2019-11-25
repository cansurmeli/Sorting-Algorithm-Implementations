import System.Environment
import System.IO
import Control.Monad
import System.TimeIt

f :: [String] -> [Integer]
f = map read

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

main :: IO()
main = do
  -- get the command line arguments
  arguments <- getArgs

  -- parse the file name
  let fileName = head arguments

  -- retrieve the file itself
  file <- openFile fileName ReadMode

  -- read the file contents
  fileContents <- hGetContents file

  -- parse the file contents & sort
  let singleWords = words fileContents
      list = f singleWords
      numbers = timeIt $ mergeSort list

  --print numbers
  hClose file

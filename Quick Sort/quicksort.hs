import System.Environment
import System.IO

quickSort :: (Ord a) => [a] -> [a]
quickSort []     = []
quickSort (x:xs) = quickSort [y | y <- xs, y <= x] ++ [x] ++ quickSort [y | y <- xs, y > x]

main = do
  arguments <- getArgs
  let fileName = head arguments
  file <- openFile fileName ReadMode
  fileContents <- hGetContents file
  --print(fileContents)
  let numbers = map read $ words fileContents
  print(numbers)
  --quickSort numbers
  hClose file

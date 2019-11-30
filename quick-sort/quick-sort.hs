import System.Environment
import System.IO
import Control.Monad

f :: [String] -> [Integer]
f = map read

quickSort :: (Ord a) => [a] -> [a]
quickSort []     = []
quickSort (x:xs) = quickSort [y | y <- xs, y <= x] ++ [x] ++ quickSort [y | y <- xs, y > x]

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
      numbers = quickSort list

  hClose file

import System.Environment
import System.IO

main = do
  arguments <- getArgs
  let fileName = head arguments
  file <- openFile fileName ReadMode
  fileContents <- hGetContents file
  let numbers = words fileContents
  print numbers
  hClose file

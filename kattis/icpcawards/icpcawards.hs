import Data.List (nubBy)
import Data.Function (on)

parse :: String -> [[String]]
parse = map words . tail . lines

solve :: [[String]] -> [[String]]
solve = take 12 . nubBy ((==) `on` head)

display :: [[String]] -> String
display = unlines . map unwords

main :: IO ()
main = interact (display . solve . parse)

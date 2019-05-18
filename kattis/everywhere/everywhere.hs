import Data.Maybe
import Text.Read
import Data.List

parse :: String -> [Maybe Integer]
parse = map (readMaybe :: Maybe Integer) . tail . lines

solve :: [[String]] -> [Int]
solve = map (length . nub)
4
display :: [Int] -> String
display = unlines . map show

main :: IO ()
main = interact (display . solve . parse)
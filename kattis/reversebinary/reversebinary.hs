import Numeric (showIntAtBase, readInt)
import Data.Char (intToDigit, digitToInt)
import Data.List (foldl')

toDec :: String -> Int
toDec = foldl' (\acc x -> acc * 2 + digitToInt x) 0

parse :: String -> Int
parse = read . head . words

solve :: Int -> Int
solve i = toDec $ reverse $ showIntAtBase 2 intToDigit i ""

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

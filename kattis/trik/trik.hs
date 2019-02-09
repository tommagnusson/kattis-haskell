import Data.List (elemIndex)
import Data.Maybe (fromJust)

cups = [True, False, False]

parse :: String -> String
parse = head . lines

solve :: String -> [Bool]
solve = foldl solve' cups

solve' :: [Bool] -> Char -> [Bool]
solve' [a,b,c] 'A' = [b,a,c]
solve' [a,b,c] 'B' = [a,c,b]
solve' [a,b,c] 'C' = [c,b,a]

display :: [Bool] -> String
display = show . (+) 1 . fromIntegral . fromJust . elemIndex True

main :: IO ()
main = interact (display . solve . parse)
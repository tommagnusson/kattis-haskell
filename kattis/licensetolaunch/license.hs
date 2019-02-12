import Data.List (elemIndex)
import Data.Maybe (fromJust)

parse :: String -> [Integer]
parse = (map read) . words . last . lines

solve :: [Integer] -> Integer
solve is = fromIntegral $ fromJust $ elemIndex (minimum is) is

display :: Integer -> String
display = show

main :: IO ()
main = interact (display . solve . parse)
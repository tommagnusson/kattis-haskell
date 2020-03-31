import Data.List (nub)

parse :: String -> [Int]
parse = map read . lines

solve :: [Int] -> Int
solve = length . nub . map (flip rem 42)

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

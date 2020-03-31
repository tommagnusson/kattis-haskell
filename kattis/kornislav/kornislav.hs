import Data.List (sort)

parse :: String -> [Int]
parse = map read . words

solve :: [Int] -> Int
solve is = min * max2
    where
        [min, _, max2, _] = sort is

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

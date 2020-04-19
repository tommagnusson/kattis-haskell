import Data.List (nub)

parse :: String -> [[Int]]
parse = map (map read . words) . tail . lines

solve :: [[Int]] -> Bool
solve iss = nub xs == xs && nub ys == ys && nub bs == bs && nub bs' == bs'
    where
        xs = map head iss
        ys = map (head . tail) iss
        bs = map sum iss
        bs' = map (\[x, y] -> x - y) iss

display :: Bool -> String
display True  = "CORRECT"
display False = "INCORRECT"

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "8\n1 5\n6 2\n3 1\n5 0\n4 6\n0 3\n2 7\n7 4"
example2 = "4\n2 3\n1 0\n0 2\n3 1"
example3 = "4\n2 3\n0 2\n1 0\n2 2"
example4 = "2\n1 0\n0 1"
example5 = "2\n0 0\n1 1"
example6 = "2\n1 2\n2 1"
example7 = "2\n0 0\n2 2"

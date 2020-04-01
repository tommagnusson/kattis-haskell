import Data.List ((\\), nub, sort)

parse :: String -> (Int, [Int])
parse s = (n, os)
    where
        ls = lines s
        n = read $ head $ words $ head ls
        os = nub $ sort $ map read $ tail ls


solve :: (Int, [Int]) -> (Int, [Int])
solve (n, os) = (got, diff)
    where
        range = [0..n-1]
        diff = range \\ os
        got = length os

display :: (Int, [Int]) -> String
display (n, os) = (unlines $ map show os) ++ "Mario got " ++ show n ++ " of the dangerous obstacles."

main :: IO ()
main = interact (display . solve . parse)

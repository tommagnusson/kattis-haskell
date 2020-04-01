import Data.List (nub)

parse :: String -> [[String]]
parse = cases id . tail . lines

solve :: [[String]] -> [Int]
solve = map solve'

solve' :: [String] -> Int
solve' = length . nub

display :: [Int] -> String
display = unlines . map show

main :: IO ()
main = interact (display . solve . parse)

cases :: (String -> a) -> [String] -> [[a]]
cases f ss = cases' f ss []

cases' :: (String -> a) -> [String] -> [[a]] -> [[a]]
cases' f ss acc 
    | length ss == 0 = acc
    | otherwise = cases' f rest (acc ++ [g])
    where
        n = read $ head ss
        g = map f $ take n $ tail ss
        rest = drop n $ tail ss

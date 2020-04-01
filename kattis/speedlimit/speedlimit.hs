parse :: String -> [[[Int]]]
parse = cases (map read . words). init . lines

solve :: [[[Int]]] -> [Int]
solve = map solve'

solve' :: [[Int]] -> Int
solve' = fst . foldl solve'' (0, 0)

solve'' :: (Int, Int) -> [Int] -> (Int, Int)
solve'' (m, h) [mph, hr] 
    | (m, h) == (0,0) = (mph * hr, hr)
    | otherwise = (m + mph * (hr - h), hr)

display :: [Int] -> String
display = unlines . map (\x -> show x ++ " miles")

main :: IO ()
main = interact (display . solve . parse)

example = "3\n20 2\n30 6\n10 7\n2\n60 1\n30 5\n4\n15 1\n25 2\n30 3\n10 5\n-1"

-- For a list of strings with test cases separated by a number
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


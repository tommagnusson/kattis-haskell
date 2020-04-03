import Data.List (intercalate, sortBy)

parse :: String -> [[String]]
parse = cases id . init . lines

solve :: [[String]] -> [[String]]
solve = map solve'

solve' :: [String] -> [String]
solve' = sortBy sortOf

sortOf :: String -> String -> Ordering
sortOf a b = take 2 a `compare` take 2 b

display :: [[String]] -> String
display = intercalate "\n" . map unlines

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

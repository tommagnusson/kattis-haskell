parse :: String -> [[Int]]
parse = map (map read . tail . words) . tail . lines

solve :: [[Int]] -> [Int]
solve = map solve'

solve' :: [Int] -> Int
solve' [b, n] = solve'' b n 0

solve'' :: Int -> Int -> Int -> Int
solve'' b n acc 
    | n < b = acc + n ^ 2
    | otherwise = solve'' b (n `div` b) (acc + (n `rem` b) ^ 2)


display :: [Int] -> String
display = unlines . map (\(a, b) -> show a ++ " " ++ show b) . zip [1..]

main :: IO ()
main = interact (display . solve . parse)

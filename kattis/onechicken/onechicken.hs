parse :: String -> [Int]
parse = map read . words

solve :: [Int] -> Int
solve [n, c] = c - n

display :: Int -> String
display i
    | i == 1 = "Dr. Chaz will have " ++ show i ++ " piece of chicken left over!"
    | i == -1 = "Dr. Chaz needs " ++ (tail $ show i) ++ " more piece of chicken!"
    | i >= 0 = "Dr. Chaz will have " ++ show i ++ " pieces of chicken left over!"
    | otherwise = "Dr. Chaz needs " ++ (tail $ show i) ++ " more pieces of chicken!"

main :: IO ()
main = interact (display . solve . parse)

parse :: String -> [Integer]
parse = map (read) . words . head . tail . lines

solve :: [Integer] -> Int
solve = length . filter (<0)

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)
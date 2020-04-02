parse :: String -> [[Integer]]
parse = map (map read . words) . lines

solve :: [[Integer]] -> [Integer]
solve = map solve'

solve' :: [Integer] -> Integer
solve' [a, b] = abs $ a - b

display :: [Integer] -> String
display = unlines . map show

main :: IO ()
main = interact (display . solve . parse)

example = "10 12\n71293781758123 72784\n1 12345677654321"

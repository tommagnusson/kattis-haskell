parse :: String -> [Integer]
parse = (map read) . tail . lines

solve :: [Integer] -> [Integer]
solve = map (((flip mod) 10) . factorial)

factorial :: Integer -> Integer
factorial 1 = 1
factorial n = n * factorial (n - 1)

display :: [Integer] -> String
display = unlines . map show

main :: IO ()
main = interact (display . solve . parse)
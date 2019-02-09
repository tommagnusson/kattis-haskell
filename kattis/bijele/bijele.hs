pieces = [1, 1, 2, 2, 2, 8]

parse :: String -> [Integer]
parse = (map read) . words

solve :: [Integer] -> [Integer]
solve = zipWith (-) pieces

display :: [Integer] -> String
display = unwords . (map show)

main :: IO ()
main = interact (display . solve . parse)
parse :: String -> (Integer, Integer)
parse = tuplify' . lines

display :: Integer -> String
display = show

solve :: (Integer, Integer) -> Integer
solve (x, y) | x > 0 && y > 0 = 1
             | x > 0 && y < 0 = 4
             | x < 0 && y < 0 = 3
             | x < 0 && y > 0 = 2

main :: IO ()
main = interact (display . solve . parse)

tuplify' :: [String] -> (Integer, Integer)
tuplify' [] = undefined
tuplify' (x:xs) = (read x, read $ head xs)
parse :: String -> (Integer, Integer)
parse = tuplify' . words

solve :: (Integer, Integer) -> Integer
solve (a, i) = (a * (i - 1)) + 1

display :: Integer -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

tuplify' :: [String] -> (Integer, Integer)
tuplify' [] = undefined
tuplify' (x:xs) = (read x, read $ head xs)
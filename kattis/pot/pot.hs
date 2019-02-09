parse :: String -> [(Integer, Integer)]
parse = (map tuplify') . tail . lines

solve :: [(Integer, Integer)] -> Integer
solve = sum . (map solve')

solve' :: (Integer, Integer) -> Integer
solve' (a, b) = a ^ b

display :: Integer -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

tuplify' :: String -> (Integer, Integer)
tuplify' [] = undefined
tuplify' s = (read $ init s, read $ [last s])
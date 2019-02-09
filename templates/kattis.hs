parse :: String -> a
parse = undefined

solve :: a -> b
solve = undefined

display :: a -> String
display = undefined

main :: IO ()
main = interact (display . solve . parse)

tuplify :: [[a]] -> [(a, a)]
tuplify = map tuplify'

tuplify' :: [a] -> (a, a)
tuplify' [] = undefined
tuplify' (x:xs) = (x, head xs)
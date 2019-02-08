-- hydrasheads
-- 1.5

type Hydra = (Integer, Integer)

parse :: String -> [(Integer, Integer)]
parse = tuplify . map (map read) . map words . lines

display :: [Integer] -> String
display = unlines . map show

solve :: [(Integer, Integer)] -> [Integer]
solve = undefined

main :: IO ()
main = interact (display . solve . parse)

tuplify :: [[Integer]] -> [(Integer, Integer)]
tuplify = map tuplify'

tuplify' :: [Integer] -> (Integer, Integer)
tuplify' [] = undefined
tuplify' (x:xs) = (x, head xs)

fight :: Hydra -> Integer
fight (0, 0) = 0
fight (1, 0) = -1
fight (2, 0) = 1
fight (0, h) | h % 2 == 0 = h / 2
             | otherwise  = h / 2 + 6
fight (t, 0) | t % 4 == 0 = (t / 2) + (t / 4)
             | t % 2 == 0 = (t / 2)
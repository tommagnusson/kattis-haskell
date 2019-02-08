-- hydrasheads
-- 1.5

-- TODO

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
fight = map fight' $ cartesianProduct (0,0)
  where fight' (1, 0) = -1
        fight' (0, 0) = 0
        fight' (2, 0) = 1
        fight' (1, 2) = 2
        fight' (0, 4) = 3
        fight' (h, t) = 1 + minimum [fight (h, t + 1), fight (h+1, t-2), fight (h-2, t)]

cartesianProduct :: (Integer, Integer) -> [(Integer, Integer)]
cartesianProduct = iterate cart

cart :: (Integer, Integer) -> (Integer, Integer)
cart (a,b) | a <= b = (a+1, b)
            | a > b  = (a, b+1)
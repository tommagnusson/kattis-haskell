parse :: String -> [(Double, Double)]
parse = (map (\(a,b) -> (read a, read b))) . tuplify . (map words). tail . lines

solve :: [(Double, Double)] -> Double
solve = sum . map solve'

solve' :: (Double, Double) -> Double
solve' (a, b) = a * b

display :: Double -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

tuplify :: [[a]] -> [(a, a)]
tuplify = map tuplify'

tuplify' :: [a] -> (a, a)
tuplify' [] = undefined
tuplify' (x:xs) = (x, head xs)
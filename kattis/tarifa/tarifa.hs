parse :: String -> (Integer, [Integer])
parse s = ((read . head) l, ((map read) . tail . tail) l)
  where 
    l = lines s

solve :: (Integer, [Integer]) -> Integer
solve (x, ps) = foldl (solve' x) x ps

solve' :: Integer -> Integer -> Integer -> Integer
solve' x p' p = p' + (x - p)

display :: Integer -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

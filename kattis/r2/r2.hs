parse :: String -> (Integer, Integer)
parse s = (read $ head ws, (read . head) $ tail ws)
  where
    ws = words s 

display :: Integer -> String
display = show

solve :: (Integer, Integer) -> Integer
solve (r1, s) = 2 * s - r1

main :: IO ()
main = interact (display . solve . parse)
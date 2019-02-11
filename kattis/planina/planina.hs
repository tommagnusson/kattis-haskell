parse :: String -> Integer
parse = read

solve :: Integer -> Integer
solve 0 = 4
solve n = l ^ 2
  where
    s = solve (n - 1)
    s' = fromIntegral s :: Double
    sq = round $ sqrt s'
    l = 2 * sq - 1

display :: Integer -> String
display = show

main :: IO ()
main = interact (display . solve . parse)
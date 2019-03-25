parse :: String -> (Double, [[Double]])
parse s = (read c, ls)
  where 
    (c:_:ss) = lines s
    ls = map (map (read) . words) ss

solve :: (Double, [[Double]]) -> Double
solve (c, ls) = sum $ map (*c) as
  where
    as = map product ls

display :: Double -> String
display = show

main :: IO ()
main = interact (display . solve . parse)
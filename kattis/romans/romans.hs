parse :: String -> Double
parse = read

solve :: Double -> Integer
solve d = round (d * 1000 * (5280 / 4854))

display :: Integer -> String
display = show

main :: IO ()
main = interact (display . solve . parse)
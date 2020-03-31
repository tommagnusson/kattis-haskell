parse :: String -> [[Double]]
parse = map (map read . words) . init . lines

solve :: [[Double]] -> [Double]
solve = map solve'

solve' :: [Double] -> Double
solve' [d, v] = ((d**3 * (pi/6) - v) / (pi / 6))**(recip 3)

display :: [Double] -> String
display = unlines . map show

main :: IO ()
main = interact (display . solve . parse)

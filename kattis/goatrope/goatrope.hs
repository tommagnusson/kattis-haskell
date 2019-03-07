parse :: String -> [Double]
parse = map read . words

solve :: [Double] -> Double
solve [x,y,x1,y1,x2,y2] = sqrt (dx * dx + dy * dy)
  where
    dx = solve' x x1 x2
    dy = solve' y y1 y2

solve' :: Double -> Double -> Double -> Double
solve' z z1 z2 = max zdist 0
  where
    zdist = abs (z - zc) - side / 2
    side = z2 - z1
    zc = (z1 + z2) / 2

display :: Double -> String
display = show

main :: IO ()
main = interact (display . solve . parse)
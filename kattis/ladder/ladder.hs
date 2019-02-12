parse :: String -> [Double]
parse = (map read) . words

solve :: [Double] -> Integer
solve [h, v] = ceiling $ h / sin (rad v)

display :: Integer -> String
display = show

rad :: Floating a => a -> a
rad d = d * (pi/180)

main :: IO ()
main = interact (display . solve . parse)
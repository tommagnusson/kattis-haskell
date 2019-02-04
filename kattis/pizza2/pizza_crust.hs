-- pizza2
-- 1.5

main :: IO ()
main = interact (showResult . doTheWork . parseInput)

parseInput :: String -> [Integer]
parseInput i = map read (words i)

calcArea :: Integer -> Double
calcArea r = pi * fromIntegral (r ^ 2)

-- calc area of r and c
-- a(r) - a(c) = diff
-- diff / a(r)
doTheWork :: [Integer] -> Double
doTheWork (x:xs) = calcArea(r-c) / calcArea(r) * 100
  where r = x
        c = head xs


showResult :: Double -> String
showResult r = show r
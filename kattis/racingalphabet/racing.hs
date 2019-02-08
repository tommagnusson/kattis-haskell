-- racingalphabet
-- Feb 7
-- 1.5

import Data.List
import Data.Maybe (fromJust)

d = 60
dp = 15 :: Double
p = 1 

circumference :: Double -> Double
circumference d = d * pi

ring = "ABCDEFGHIJKLMNOPQRSTUVWXYZ '"
ringl = fromIntegral $ length ring

space = (circumference d) / (fromIntegral $ length ring)

-- [(W, I), (I, N), ...]
pairMessage :: [a] -> [(a, a)]
pairMessage xs = zip xs $ tail xs

distance :: (Char, Char) -> Integer
distance (from, to) = minimum [(ringl - dist) , dist]
  where
    i :: Char -> Integer
    i e = toInteger $ fromJust $ elemIndex e ring
    iFrom =  i from
    iTo = i to
    dist = abs $ iTo - iFrom

pickupTime :: String -> Double
pickupTime = fromIntegral . length

findTime :: String -> Double
findTime m = pickup + (feetDist / dp)
    where 
      feetDist = sum $ map (((*) space) . fromIntegral . distance) $ pairMessage m
      pickup = pickupTime m

parse :: String -> [String]
parse = tail . lines

display :: [Double] -> String
display = unlines . map (show)

solve :: [String] -> [Double]
solve = map findTime

main :: IO ()
main = interact (display . solve . parse)
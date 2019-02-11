import Data.List (elemIndex)
import Data.Maybe (fromJust)

parse :: String -> [[Integer]]
parse = map ((map read) . words) . lines

solve :: [[Integer]] -> (Integer, Integer)
solve scores = (i+1, winner)
  where
    sums = map sum scores 
    winner = maximum sums
    i = fromIntegral $ fromJust $ elemIndex winner sums

display :: (Integer, Integer) -> String
display (a, b) = (show a) ++ " " ++ (show b)

main :: IO ()
main = interact (display . solve . parse)
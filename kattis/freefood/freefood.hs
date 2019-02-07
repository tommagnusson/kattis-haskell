-- Thomas Magnusson
-- freefood
-- Feb 4

import Data.Set as Set

main :: IO ()
main = interact (showResult . doTheWork . parseInput)

parseInput :: String -> [(Integer, Integer)]
parseInput = Prelude.map (pair . words) . tail . lines
  where
    pair :: [String] -> (Integer, Integer) 
    pair (x:xs) = (read x, read $ head xs)

dateRange :: (Integer, Integer) -> [Integer]
dateRange (a, b) = [a..b]

doTheWork :: [(Integer, Integer)] -> Integer
doTheWork = toInteger . size . Set.fromList . concat . Prelude.map dateRange


showResult :: Integer -> String
showResult = show
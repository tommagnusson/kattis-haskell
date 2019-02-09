import Data.Maybe
import qualified Data.Set as S (fromList, size, toList, map)

parse :: String -> (Integer, [String])
parse s = (read $ head $ head ws, map head $ tail ws)
  where
    ws :: [[String]] 
    ws = map words $ lines s

display :: a -> String
display = undefined

solve :: (Integer, [String]) -> Maybe Integer
solve (i, ps) | i > setL  = Nothing
              | i == setL = if ps == (S.toList set) then Just i else Nothing
              | otherwise = if elem [] highestIndicies then Nothing else Just $ maximum highestIndicies
    where
      set = S.fromList ps 
      setL = fromIntegral S.size set
      highestIndex :: [String] -> Integer
      highestIndex s = last $ elemIndices s ps
      highestIndicies = S.toList . (S.map highestIndex set)


main :: IO ()
main = interact (display . solve . parse)
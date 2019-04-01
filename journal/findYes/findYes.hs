import Data.Maybe

-- Find first occurrence in string of "yes"
findYes = findYes' 0

findYes' :: Int -> String -> Maybe Int
findYes' _ [] = Nothing
findYes' i (y:e:s:ss) =
  if y == 'y' && e == 'e' && s == 's' then Just i
  else findYes' (i + 1) (e:s:ss)
findYes' _ (x:xs) = Nothing
    
import Merge

mergesort :: Ord a => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = merge sortedLeft sortedRight []
  where 
    half = length xs `div` 2
    (left, right) = splitAt half xs
    sortedLeft = mergesort left
    sortedRight = mergesort right
# Entry 10

## March 11

# Folding Lab

## Complete the Folds

1. Complete the expansion step-by-step
   1. `foldr (+) 0 [1,2,3,4]`
      1. `= 1 + foldr (+) 0 [2,3,4]`
      2. `= 3 + foldr (+) 0 [3,4]`
      3. `= 6 + foldr (+) 0 [4]`
      4. `= 10 + foldr (+) 0 []`
      5. `= 10`
   2. `foldl (+) 0 [1,2,3,4]`
      1. `= foldl (+) (0+1) [2,3,4]`
      2. `= foldl (+) (1+2) [3,4]`
      3. `= foldl (+) (3+3) [4]`
      4. `= foldl (+) (6+4) []`
      5. `= 10`
2. Implement as folds...
   1. `product'`
      1. `product' :: Num a => [a] => a`
      2. `product' xs = foldr (*) 1 xs`
   2. `concat'`
      1. `concat' :: [[a]] -> [a]`
      2. `concat' xs = foldr (++) [] xs`
   3. `maximum'`
      1. `maximum' :: Ord a, Bounded a => [a] -> a`
      2. `maximum' xs = foldr max (minBound a) xs`
   4. `reverse'`
      1. `reverse' :: [a] -> [a]`
      2. `reverse' xs = foldl (flip (:)) []`
   5. `all'`
      1. `all' :: (a -> Bool) -> [a] -> Bool`
      2. `all' p xs = foldr (\x y -> p x && p y) True xs`
   6. `filter'`
      1. `filter' :: (a -> Bool) -> [a] -> [a]`
      2. `filter' p xs = foldr (\x y -> if p x then [x]++y else []++y) [] xs`
   7. `map'`
      1. `map' :: (a -> b) -> [a] -> [b]`
      2. `map' f xs = foldr (\x y -> f x:y) [] xs`

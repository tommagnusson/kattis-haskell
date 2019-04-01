
subsetSum :: [Int] -> Int -> Bool
subsetSum _ 0 = True
subsetSum [] sum = sum == 0
subsetSum (x:xs) sum
  | x == sum = True
  | x > sum = subsetSum xs sum
  | otherwise = subsetSum xs sum || subsetSum xs (sum - x)
  
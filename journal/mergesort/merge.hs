-- merge two-pointer algorithm
module Merge where

merge :: Ord a => [a] -> [a] -> [a] -> [a]
merge [] [] zs = zs
merge xs [] zs = zs ++ xs
merge [] ys zs = zs ++ ys
merge xss@(x:xs) yss@(y:ys) zs
  | x < y  = merge xs yss (zs ++ [x])
  | x > y  = merge xss ys (zs ++ [y])
  | otherwise = merge xs ys (zs ++ [x] ++ [y])
any :: (a -> Bool) -> [a] -> Bool
any p xs = foldr ((||).p) False xs

any' :: (a -> Bool) -> [a] -> Bool
any' p xs = foldl (flip ((||).p)) False xs

any'' :: (a -> Bool) -> [a] -> Bool
any'' p xs = foldl (\x -> \y -> x || p y) False xs
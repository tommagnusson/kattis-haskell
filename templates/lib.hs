-- finds the count of an element in a given list
countOf :: Eq a => a -> [a] -> Int
countOf a = length . filter ((==) a)

-- Breaks up a list into n sized chunks
splitEvery :: Int -> [a] -> [[a]]
splitEvery _ [] = []
splitEvery n list = first : (splitEvery n rest)
    where
        (first, rest) = splitAt n list

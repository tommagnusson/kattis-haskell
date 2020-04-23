-- finds the count of an element in a given list
countOf :: Eq a => a -> [a] -> Int
countOf a = length . filter ((==) a)

-- Breaks up a list into n sized chunks
splitEvery :: Int -> [a] -> [[a]]
splitEvery _ [] = []
splitEvery n list = first : (splitEvery n rest)
    where
        (first, rest) = splitAt n list

-- For a list of strings, starting with a number n, 
-- and n test cases, then another number m, m test cases, etc
cases :: (String -> a) -> [String] -> [[a]]
cases f ss = cases' f ss []

cases' :: (String -> a) -> [String] -> [[a]] -> [[a]]
cases' f ss acc 
    | length ss == 0 = acc
    | otherwise = cases' f rest (acc ++ [g])
    where
        n = read $ head ss
        g = map f $ take n $ tail ss
        rest = drop n $ tail ss

-- Takes an element by which to break up the list and splits the list into
-- sublists, which would normally end with that element
-- NOTE: the last element in the list must match the element passed in
casesByEnding :: Eq a => a -> [a] -> [[a]]
casesByEnding s ss 
    | null x = []
    | otherwise = x: casesByEnding s (tail rest)
        where
           (x, rest) = break (== s) ss

-- example of recursive string replacement
solve :: String -> String
solve ('a':'p':'a':xs) = 'a': solve xs
solve ('e':'p':'e':xs) = 'e': solve xs
solve ('i':'p':'i':xs) = 'i': solve xs
solve ('o':'p':'o':xs) = 'o': solve xs
solve ('u':'p':'u':xs) = 'u': solve xs
solve (x:xs) = x: solve xs
solve "" = ""

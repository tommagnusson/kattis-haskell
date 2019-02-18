replace :: a -> [a] -> Int -> [a]
replace _ [] _ = []
replace y (x:xs) i | i == 0 = (y:xs) | otherwise = (x:(replace y xs (i-1)))

median :: Num a => [a] -> a
median as | l `mod` 2 == 0 = (fromIntegral $ sum $ twoMed l as) / l
          | otherwise      = oneMed l as
  where l = fromIntegral $ length as

oneMed :: Num a => Int -> [a] -> a
oneMed = undefined

twoMed :: Num a => Int -> [a] -> [a]
twoMed = undefined

type Max = Int
type Min = Int

-- T(n) = number of comparisons in an array of size n
-- T(n) = 2 + 2T(n/2)
-- T(n/2) = 2 + 2T(n/4)
-- T(n/4) = 2 + 2T(n/8)
-- T(2) = 1
-- T(1) = 0

-- T(n) = 2 + 2T(n/2)
-- T(n) = 2 + 2(2 + 2T(n/4)) = 2 + 4 + 4T(n/4)
-- = 2 + 4 + 4(2 + 2T(n/8)) = 2 + 4 + 8 + 8T(n/8)
-- = 2^1 + 2^2 + 2^3 + 2^3T(n/2^3)
-- T(n) = 2^1 + ... + 2^k + (2^k)T(n/(2^k))
-- because T(n/2^k) = T(2); n/2^k = 2
-- let k+1 = log2n

minmax :: [Int] -> (Min, Max)
minmax [a] = (a, a)
minmax [a, b] | a < b = (a, b) -- 1
              | otherwise = (b, a)
minmax xs = (min, max)
  where
    half = length xs `div` 2
    (left, right) = splitAt half xs
    (minl, maxl) = minmax left
    (minr, maxr) = minmax right
    min = if minl < minr then minl else minr -- 1
    max = if maxl > maxr then maxl else maxr -- 1
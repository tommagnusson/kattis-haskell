
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
-- T(n) = (2^k)T(2) + 2^k + 2^k-1 + ... + 2
-- .... T(n) = 1.5n - 2

minmax :: Ord a => [a] -> (a, a)
minmax [a] = (a, a)
minmax [a, b] = (min a b, max a b)
minmax xs = (mini, maxi)
  where
    half = length xs `div` 2
    (left, right) = splitAt half xs
    (minl, maxl) = minmax left
    (minr, maxr) = minmax right
    mini = min minl minr -- 1
    maxi = max maxl maxr -- 1
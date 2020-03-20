parse :: String -> [Integer]
parse = (map read) . words . head . tail . lines

solve :: [Integer] -> Double
solve bs = realToFrac (sum rs) / realToFrac l
    where
        rs = filter (/= -1 ) bs
        l = length rs

display :: Double -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

-- "3\n3 0 2"
-- "3\n1 -1 4"
-- "11\n-1 -1 -1 -1 0 0 0 0 0 0 1"

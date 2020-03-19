parse :: String -> [Int]
parse s = map read (words s)

solve :: [Int] -> Int
solve [n, h, v] = h' * v' * 4
    where
        n' = n `div` 2 
        h' = if h > n' then h else n - h
        v' = if v > n' then v else n - v

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

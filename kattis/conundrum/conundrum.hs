parse :: String -> String
parse = head . words

solve :: String -> Int
solve s = foldr (\a b -> if uncurry (==) a then b else b + 1) 0 zs
    where
        n = length s
        p = take n $ cycle "PER"
        zs = zip s p

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

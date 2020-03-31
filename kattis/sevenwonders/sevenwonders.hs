parse :: String -> String
parse = id

solve :: String -> Int
solve s = squares + triplets
    where
        counts = map (\x -> length $ filter ((==) x) s) ['T','C', 'G']
        squares = sum $ map (flip (^) 2) counts
        triplets = 7 * minimum counts 

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

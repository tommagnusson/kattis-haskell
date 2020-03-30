parse :: String -> Int
parse = read

solve :: Int -> (Int, [(Int, Int)])
solve s = (s, solve' s)

solve' :: Int -> [(Int, Int)]
solve' s = solve'' s [2..(s + 1) `div` 2] []
        
solve'' :: Int -> [Int] -> [(Int, Int)] -> [(Int, Int)]
solve'' s rs acc
    | length rs == 0 = acc
    | c1 && c2 = solve'' s rss $ acc ++ [(r, y)] ++ [(r, r)]
    | c1 = solve'' s rss $ acc ++ [(r, y)]
    | s `rem` r == 0 = solve'' s rss $ acc ++ [(r, r)] 
    | otherwise = solve'' s rss acc
    where
        (r:rss) = rs
        y = r - 1;
        c1 = s `rem` (r + y) == r || s `rem` (r + y) == 0 
        c2 = s `rem` r == 0 


display :: (Int, [(Int, Int)]) -> String
display (s, ss) = show s ++ ":\n" ++ display' ss

display' :: [(Int, Int)] -> String
display' = unlines . map (\(a, b) -> show a ++ "," ++ show b)

main :: IO ()
main = interact (display . solve . parse)

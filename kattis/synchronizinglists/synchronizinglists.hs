parse :: String -> [[[Int]]]
parse = map (map pairToList) . cases . map read . lines

solve :: [[[Int]]] -> [[Int]]
solve = undefined

display :: [[Int]] -> String
display = init . concat . map (\i -> (unlines $ (map show i)) ++ "\n")

main :: IO ()
main = interact (display . solve . parse)

cases :: [Int] -> [[Int]]
cases ss = cases' ss []

cases' :: [Int] -> [[Int]] -> [[Int]]
cases' ss acc 
    | length ss == 0 = acc
    | otherwise = cases' rest (acc ++ [g])
    where
        n = (head ss) * 2
        g = take n $ tail ss
        rest = drop n $ tail ss

halve :: [a] -> ([a], [a])
halve list = splitAt ((length (list) + 1) `div` 2) list

pairToList :: (a, a) -> [a]
pairToList (x,y) = [x,y]

example = "4\n10\n67\n68\n28\n55\n73\n10\n6\n7\n98\n23\n61\n49\n1\n79\n9\n1\n15\n32\n47\n68\n39\n24\n0"

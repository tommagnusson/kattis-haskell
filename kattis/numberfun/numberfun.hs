parse :: String -> [[Double]]
parse = map (map read . words) . tail . lines

solve :: [[Double]] -> [Bool]
solve = map solve'

solve' :: [Double] -> Bool
solve' [a,b,c] = a + b == c || a - b == c || b - a == c || a / b == c || b / a == c || a * b == c

display :: [Bool] -> String
display = unlines . map display'

display' :: Bool -> String
display' True  = "Possible"
display' False = "Impossible"

main :: IO ()
main = interact (display . solve . parse)

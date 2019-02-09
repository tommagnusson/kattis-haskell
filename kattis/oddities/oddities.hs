parse :: String -> [Integer]
parse = (map read) . tail . lines

solve :: [Integer] -> [(Integer, Bool)]
solve is = zip is $ map even is

display :: [(Integer, Bool)] -> String
display = unlines . map display'

display' :: (Integer, Bool) -> String
display' (i, p) = (show i) ++ " is " ++ (display'' p)

display'' :: Bool -> String
display'' True = "even"
display'' False = "odd"

main :: IO ()
main = interact (display . solve . parse)
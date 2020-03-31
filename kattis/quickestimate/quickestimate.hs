parse :: String -> [String]
parse = tail . lines

solve :: [String] -> [Int]
solve = map length

display :: [Int] -> String
display = unlines . map show

main :: IO ()
main = interact (display . solve . parse)

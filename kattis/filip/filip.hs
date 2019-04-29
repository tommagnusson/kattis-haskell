parse :: String -> [String]
parse = words

solve :: [String] -> Integer
solve = maximum . map (read. reverse)

display :: Integer -> String
display = show

main :: IO ()
main = interact (display . solve . parse)
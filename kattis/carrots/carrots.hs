parse :: String -> String
parse = (head . tail) . head . (map words) . lines

display :: String -> String
display = id

solve :: String -> String
solve = id

main :: IO ()
main = interact (display . solve . parse)
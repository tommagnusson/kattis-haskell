parse :: String -> Integer
parse = read

solve :: Integer -> [String]
solve i = map (\j -> (show j) ++ " Abracadabra") [1..i]

display :: [String] -> String
display = unlines

main :: IO ()
main = interact (display . solve . parse)
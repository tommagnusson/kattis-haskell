parse :: String -> String
parse = head . words

solve :: String -> String
solve = foldr acc ""

acc :: Char -> String -> String
acc c cs
    | length cs == 0 = c:cs
    | head cs == c = cs
    | otherwise = c:cs

display :: String -> String
display = id

main :: IO ()
main = interact (display . solve . parse)

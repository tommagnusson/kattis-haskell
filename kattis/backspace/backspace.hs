parse :: String -> String
parse = head . words

solve :: String -> String
solve = solve' ""

solve' :: String -> String -> String
solve' stack "" = reverse stack
solve' (_:st) ('<':ss) = solve' st ss
solve' stack (s:ss) = solve' (s:stack) ss

display :: String -> String
display = id

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

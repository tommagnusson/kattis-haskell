parse :: String -> [String]
parse = tail . lines

solve :: [String] -> [String]
solve = map solve'

solve' :: String -> String
solve' ('s':'i':'m':'o':'n':' ':'s':'a':'y':'s':' ':command) = command
solve' _ = ""

display :: [String] -> String
display = unlines

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "4\nsimon says write a program\nprint some output\nsimon whispers do not stress\nsimon says get balloons"

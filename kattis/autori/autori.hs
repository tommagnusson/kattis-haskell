import Data.Char (isUpper)

parse :: String -> String
parse = filter isUpper

solve :: String -> String
solve = id

display :: String -> String
display = id

main :: IO ()
main = interact (display . solve . parse)
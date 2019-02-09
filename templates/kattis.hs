parse :: String -> a
parse = undefined

display :: a -> String
display = undefined

solve :: a -> b
solve = undefined

main :: IO ()
main = interact (display . solve . parse)
parse :: String -> a
parse = undefined

solve :: a -> b
solve = undefined

display :: a -> String
display = undefined

main :: IO ()
main = interact (display . solve . parse)
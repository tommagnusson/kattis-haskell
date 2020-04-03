parse :: String -> a
parse = undefined

solve :: a -> b
solve = undefined

display :: a -> String
display = undefined

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

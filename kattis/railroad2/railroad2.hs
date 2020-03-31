parse :: String -> [Int]
parse = map read . words

solve :: [Int] -> Bool
solve [x,y] = (4 * x + 3 * y) `rem` 2 == 0

display :: Bool -> String
display False = "impossible"
display True  = "possible"

main :: IO ()
main = interact (display . solve . parse)

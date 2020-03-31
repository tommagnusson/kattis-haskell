parse :: String -> [Int]
parse = map read . words

solve :: [Int] -> (Bool, Int)
solve [0, 0] = (False, -1)
solve [l, r] 
    | l == r = (True, l + r)
    | otherwise = (False, 2 * max l r)

display :: (Bool, Int) -> String
display (_, -1) = "Not a moose"
display (True, x) = "Even " ++ show x
display (False, x) = "Odd " ++ show x

main :: IO ()
main = interact (display . solve . parse)

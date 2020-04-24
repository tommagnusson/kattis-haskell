parse :: String -> (Bool, [String])
parse s = (n' `rem` 2 /= 0, bs)
    where
        (n:bs) = words s
        n' = read n :: Int

solve :: (Bool, [String]) -> Bool
solve (opposite, [x, y]) 
    | opposite  = all (uncurry (/=)) $ zip x y
    | otherwise = x == y

display :: Bool -> String
display True = "Deletion succeeded"
display False = "Deletion failed"

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "1\n10001110101000001111010100001110\n01110001010111110000101011110001"
example2 = "20\n0001100011001010\n0001000011000100"
example3 = "1\n101\n010"

parse :: String -> Integer
parse = read

solve :: Integer -> Integer
solve = (+1) . sum . takeWhile (/= 1) . iterate solve'

solve' :: Integer -> Integer
solve' 1 = 1
solve' n
    | n `rem` 2 == 0 = n `div` 2
    | otherwise = 3 * n + 1

display :: Integer -> String
display = show

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

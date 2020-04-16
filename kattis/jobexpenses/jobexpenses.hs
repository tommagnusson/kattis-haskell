parse :: String -> [Int]
parse = map read . tail . words

solve :: [Int] -> Int
solve = abs . sum . filter (< 0)

display :: Int -> String
display = show

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "3\n1 -2 3"

example2 = "5\n129 44 394 253 147"

example3 = "10\n-100 40000 -6500 -230 -18 34500 -450 13000 -100 5000"

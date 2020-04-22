parse :: String -> [Int]
parse = map read . tail . words

solve :: [Int] -> [Int]
solve = map solve'

-- 400 cal per bottle

solve' :: Int -> Int
solve' i = i `div` 400 + (if i `rem` 400 == 0 then 0 else 1)

display :: [Int] -> String
display = unlines . map show

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "2\n2000\n1600" -- 5 4
example2 = "a\n500" -- 2

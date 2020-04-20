import Data.List (sortBy)

parse :: String -> [Int]
parse = map read . tail . words

solve :: [Int] -> Int
solve = solve' . zip [1..] . sortBy (flip compare)

solve' :: [(Int, Int)] -> Int
solve' = (+1) . maximum . map (+++)

(+++) :: (Int, Int) -> Int
(+++) = uncurry (+)

display :: Int -> String
display = show

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "4\n2 3 4 3"
example2 = "6\n39 38 9 35 39 20"

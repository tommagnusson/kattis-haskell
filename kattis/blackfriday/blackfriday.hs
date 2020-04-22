import Data.Function (on)
import Data.List (sortBy, groupBy, uncons)

parse :: String -> [Int]
parse = map read . words . head . tail . lines

solve :: [Int] -> Maybe Int
solve = fmap (fst . head . fst) . uncons . dropWhile ((>1) . length) . groupBy ((==) `on` snd) . sortBy (flip compare `on` snd) . zip [1..]

display :: Maybe Int -> String
display (Just n)  = show n
display Nothing = "none"

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "8\n1 1 1 5 3 4 6 6" -- 4
example2 = "3\n4 4 4" -- none

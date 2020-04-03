import Data.List (lookup, sort)
import Data.Maybe (fromJust)

type Case = ([Int], String)

parse :: String -> Case
parse s = (is, as)
    where
        (l:ls) = lines s
        is = map read $ words $ l
        as = head $ ls

solve :: Case -> [Int]
solve (is, as) = map (solve' sorted) as
    where 
        sorted = zip "ABC" $ sort is

solve' :: [(Char, Int)] -> Char -> Int
solve' sorted c = fromJust $ lookup c sorted

display :: [Int] -> String
display = unwords . map show

main :: IO ()
main = interact (display . solve . parse)

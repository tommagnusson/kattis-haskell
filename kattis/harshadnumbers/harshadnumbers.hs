import Data.List (find)
import Data.Maybe (fromJust)

parse :: String -> String
parse = id

solve :: String -> Int
solve n = read $ fromJust $ find isHarshad $ map show [n'..]
    where
        n' = read n :: Int

isHarshad :: String -> Bool
isHarshad s = ((read s :: Int) `rem` (sum $ toDigits s)) == 0

toDigits :: String -> [Int]
toDigits = map (read . pure)

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

import Data.Char (toLower, isAlpha)
import Data.Set (Set, fromList, fromDistinctAscList, isSubsetOf, difference, toList)

parse :: String -> [Set Char]
parse = map fromList . tail . lines . map toLower

solve :: [Set Char] -> [String]
solve = map solve'

solve' :: Set Char -> String
solve' cs 
    | letters `isSubsetOf` cs = "pangram"
    | otherwise = "missing " ++ diff
        where
            diff = filter isAlpha $ toList $ letters `difference` cs

display :: [String] -> String
display = unlines

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

letters = fromDistinctAscList "abcdefghijklmnopqrstuvwxyz"

example = "3\nThe quick brown fox jumps over the lazy dog.\nZYXW, vu TSR Ponm lkj ihgfd CBA.\n.,?!'\" 92384 abcde FGHIJ"

import Debug.Trace (traceShowId, trace)
import Text.Read (readMaybe)
import Data.Maybe (isJust, fromJust)
import Data.List (sortOn)

parse :: String -> [[String]]
parse = map words . tail . lines

getInteger :: String -> Maybe Int
getInteger i = readMaybe i

solve :: [[String]] -> [String]
solve = map snd . sortOn fst . map solve'

solve' :: [String] -> (Int, String)
solve' [x, y]
    | isJust $ getInteger y = (fromJust $ getInteger y, x)
    | otherwise = ((fromJust $ getInteger x) `div` 2, y)


display :: [String] -> String
display = unlines

main :: IO ()
main = interact (display . solve . parse)

example = "3\nred 10\n10 blue\ngreen 7"

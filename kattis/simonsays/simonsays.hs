import Data.List (isPrefixOf)

parse :: String -> [String]
parse = tail . lines

solve :: [String] -> [String]
solve = filter (not . null) . map solve'

solve' :: String -> String
solve' s
    | simon `isPrefixOf` s = drop 11 s
    | otherwise = ""

display :: [String] -> String
display = unlines

main :: IO ()
main = interact (display . solve . parse)

simon = "Simon says "

example = "3\nSimon says raise your right hand.\nLower your right hand.\nSimon says raise your left hand."

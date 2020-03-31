import Data.List (isInfixOf)
import Data.Char (toLower)

parse :: String -> [String]
parse = tail . lines . map toLower

solve :: [String] -> Int
solve = length . filter (\x -> isInfixOf "rose" x || isInfixOf "pink" x)

display :: Int -> String
display 0 = "I must watch Star Wars with my daughter"
display i = show i

main :: IO ()
main = interact (display . solve . parse)

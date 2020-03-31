import Data.List (isInfixOf)

parse :: String -> [String]
parse = lines

solve :: [String] -> [Int]
solve = map fst . filter (isInfixOf "FBI" . snd) . zip [1..]

display :: [Int] -> String
display [] = "HE GOT AWAY!"
display is = unwords $ map show is

main :: IO ()
main = interact (display . solve . parse)

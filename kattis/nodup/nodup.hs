import Data.List (nub)

parse :: String -> [String]
parse = words

solve :: [String] -> Bool
solve ss = l == l'
    where
        l = length ss
        l' = length $ nub ss

display :: Bool -> String
display True  = "yes"
display False = "no"

main :: IO ()
main = interact (display . solve . parse)

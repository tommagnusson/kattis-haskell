import Data.List
import Data.Maybe (fromMaybe)

parse :: String -> String
parse = id

display :: Bool -> String
display True  = "hiss"
display False = "no hiss" 

solve :: String -> Bool
solve s = elem ('s','s') $ zip s (tail s)

main :: IO ()
main = interact (display . solve . parse)
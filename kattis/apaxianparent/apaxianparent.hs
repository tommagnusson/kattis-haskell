import Data.List (isSuffixOf)

parse :: String -> [String]
parse = words

otherVowels = ["a","e", "i", "o", "u"]

solve :: [String] -> String
solve [y, p] 
    | "e" `isSuffixOf` y = y ++ "x" ++ p
    | or $ map (flip isSuffixOf y) otherVowels = init y ++ "ex" ++ p
    | "ex" `isSuffixOf` y = y ++ p
    | otherwise = y ++ "ex" ++ p

display :: String -> String
display = id

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "menolaxios mox"
example2 = "alemaxe maxos"
example3 = "pamoli toxes"
example4 = "andrex naxos"

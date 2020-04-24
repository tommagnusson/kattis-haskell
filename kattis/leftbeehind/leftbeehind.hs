parse :: String -> [[Int]]
parse = init . map (map read . words) . lines

solve :: [[Int]] -> [String]
solve = map solve'

solve' :: [Int] -> String
solve' [sweet, sour]
    | sour + sweet == 13 = "Never speak again."
    | sour > sweet = "Left beehind."
    | sour < sweet = "To the convention."
    | otherwise    = "Undecided."


display :: [String] -> String
display = unlines

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "17 3\n13 14\n8 5\n44 44\n0 0"

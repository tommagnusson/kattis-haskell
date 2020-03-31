-- Breaks up a list into n sized chunks
splitEvery :: Int -> [a] -> [[a]]
splitEvery _ [] = []
splitEvery n list = first : (splitEvery n rest)
    where
        (first, rest) = splitAt n list

parse :: String -> [[String]]
parse = splitEvery 2 . tail . lines

solve :: [[String]] -> [[String]]
solve = map solve'

solve' :: [String] -> [String]
solve' [a, b] = [a, b, rep]
    where 
        zs = zip a b
        rep = map (solve'' . uncurry (==)) zs

solve'' :: Bool -> Char
solve'' True = '.'
solve'' False = '*'

display :: [[String]] -> String
display = unlines . map unlines

main :: IO ()
main = interact (display . solve . parse)

example = "3\nATCCGCTTAGAGGGATT\nGTCCGTTTAGAAGGTTT\nabcdefghijklmnopqrstuvwxyz\nbcdefghijklmnopqrstuvwxyza\nabcdefghijklmnopqrstuvwxyz0123456789\nabcdefghijklmnopqrstuvwxyz0123456789"

expected = "ATCCGCTTAGAGGGATT\nGTCCGTTTAGAAGGTTT\n*....*.....*..*..\n\nabcdefghijklmnopqrstuvwxyz\nbcdefghijklmnopqrstuvwxyza\n**************************\n\nabcdefghijklmnopqrstuvwxyz0123456789\nabcdefghijklmnopqrstuvwxyz0123456789\n....................................\n\n"

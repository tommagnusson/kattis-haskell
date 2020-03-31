import Data.List (transpose)

-- Breaks up a list into n sized chunks
splitEvery :: Int -> [a] -> [[a]]
splitEvery _ [] = []
splitEvery n list = first : (splitEvery n rest)
    where
        (first, rest) = splitAt n list

parse :: String -> [String]
parse = tail . lines

solve :: [String] -> [String]
solve = map solve'

solve' :: String -> String
solve' s = concat $ transpose $ map reverse ss
    where
        r = floor $ sqrt $ fromIntegral $ length s
        ss = splitEvery r s


display :: [String] -> String
display = unlines

main :: IO ()
main = interact (display . solve . parse)

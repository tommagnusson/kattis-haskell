import Data.Maybe (isNothing, fromJust)

parse :: String -> [Int]
parse = map read . words

solve :: [Int] -> String
solve xs = fromJust $ head $ dropWhile isNothing $ map (solve' xs) ops

solve' :: [Int] -> (Int -> Int -> Int, String) -> Maybe String
solve' [a, b, c] (f, op) 
    | c == f a b =  Just $ show a ++ op ++ show b ++ "=" ++ show c
    | a == f b c = Just $ show a ++ "=" ++ show b ++ op ++ show c
    | otherwise = Nothing

-- either a ? b = c or a = b ? c

ops = [((+), "+"), ((-), "-"), (div, "/"), ((*), "*")]

display :: String -> String
display = id

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "5 3 8"
example2 = "5 15 3"

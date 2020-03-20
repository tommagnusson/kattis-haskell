import Data.Char (digitToInt)

parse :: String -> (Int, Char, [String])
parse ss = (digitToInt $ head h, head s, cs)
    where 
        (i:cs) = lines ss
        (h:s:_) = words i

solve' :: Char -> String -> Int
solve' dom [i, s] = val (dom == s) i

solve :: (Int, Char, [String]) -> Int
solve (_, d, cs) = foldr (+) (0) (map (solve' d) cs) 


val :: Bool -> Char -> Int
val _ 'A' = 11
val _ 'K' = 4
val _ 'Q' = 3
val True 'J' = 20
val False 'J' = 2
val _ 'T' = 10
val True '9' = 14
val False '9' = 0
val _ _ = 0

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

import Data.List ((\\))
import Data.Maybe (listToMaybe)

parse :: String -> (Int, Int, [Int])
parse s = (r, n, rs)
    where 
        (h:rest) = lines s
        [r,n] = map read . words $ h
        rs = map read rest

solve :: (Int, Int, [Int]) -> Maybe Int
solve (r, n , rs)
    | r == n = Nothing
    | otherwise = listToMaybe ([1..r] \\ rs)

display :: Maybe Int -> String
display (Just n) = show n
display Nothing = "too late"

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "100 5\n42\n3\n2\n99\n1" -- 23 or not one of the inputs
example2 = "3 3\n2\n3\n1" -- "too late"

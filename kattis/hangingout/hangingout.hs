import Debug.Trace

type SafetyNum = Int
type GroupsDenied = Int
type PeopleThere = Int
type RemainingGroups = [Int]

parse :: String -> (Int, [Int])
parse ss = (s, gs)
    where 
        s = read $ head $ words $ head $ lines ss-- safety number
        gs = map parse' $ tail $ lines ss -- groups entering or leaving, entering is pos, leaving neg

-- "enter 2" -> 2
-- "leave 4" -> -4
parse' :: String -> Int
parse' (s:ss) 
    | s == 'e' = read $ drop 5 ss
    | otherwise =  read $ "-" ++ drop 5 ss

solve :: (Int, [Int]) -> Int
solve (n, gs) = solve' n 0 0 gs

solve' :: SafetyNum -> PeopleThere -> GroupsDenied -> RemainingGroups -> GroupsDenied
solve' n p d gs
    | length gs == 0 = d
    | p + group > n = solve' n p (d + 1) rest
    | otherwise = solve' n (p + group) d rest
    where
        group = head gs
        rest = tail gs

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

-- eg.
expected2 = "4 5\nenter 3\nenter 2\nleave 1\nenter 1\nenter 2\n"

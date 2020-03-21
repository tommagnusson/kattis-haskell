import Debug.Trace (trace, traceShow)

data DriveResult = Touchdown | Safety | Turnover
type Down = Int
type Yards = Int

parse :: String -> [Yards]
parse = map read . words . head . tail . lines

solve :: [Yards] -> DriveResult
solve ds = solve' 1 10 20 ds

-- 1st and 10 at the 20 with [Yard] drives
solve' :: Down -> Yards -> Yards -> [Yards] -> DriveResult
solve' d tg x ds
    | d > 4 = Turnover
    | length ds == 0 = Turnover
    | nextx >= 100 = Touchdown
    | nextx <= 0 = Safety
    | tg - next <= 0 = solve' 1 10 nextx rest
    | otherwise = solve' (d + 1) (tg - next) nextx rest
    where 
        next =  head ds
        nextx = x + next
        rest = tail ds


display :: DriveResult -> String
display Touchdown = "Touchdown"
display Safety = "Safety"
display Turnover = "Nothing"

main :: IO ()
main = interact (display . solve . parse)

-- examples
expectedTouchdown = [10,3,8,22,-4,16,8,3,14] :: [Int]
expectedNothing = [9,15,2,-5,3,8,18,3,25,2] :: [Int]

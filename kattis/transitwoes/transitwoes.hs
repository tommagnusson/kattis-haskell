import Debug.Trace

type CurrentTime = Int

parse :: String -> (Int, Int, Int, [Int], [Int], [Int])
parse ss = (s, t, n, ds, bs, cs)
    where 
        [[s, t, n], ds, bs, cs] = map (map read . words) $ lines ss

-- start off the recursion
solve :: (Int, Int, Int, [Int], [Int], [Int]) -> Bool
solve (s, t, n, ds, bs, cs) = solve' s ds bs cs <= t

-- Recursive function
solve' :: CurrentTime -> [Int] -> [Int] -> [Int] -> CurrentTime
solve' t (d:ds) bs cs
    | length ds == 0 = d + t -- no more stops
    | wait == 0 = solve' (b + t) ds (tail bs) (tail cs) -- bus is here, carry on
    | otherwise = solve' (wait + t + b) ds (tail bs) (tail cs) -- bus is not here, wait 
    where
        wait = c - (t `rem` c)
        b = head bs
        c = head cs

-- while i < len(ds) - 1

display :: Bool -> String
display True = "yes"
display False = "no"

main :: IO ()
main = interact (display . solve . parse)

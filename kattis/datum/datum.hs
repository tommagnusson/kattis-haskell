import Data.Time
import qualified Data.Time.Calendar.WeekDate as W

parse :: String -> (Int, Int)
parse = tuplify' . (map read) . words

solve :: (Int, Int) -> Int
solve (day, month) = thd $ W.toWeekDate d
  where d = fromGregorian 2009 month day

thd :: (a, b, b) -> b
thd (_, _, b) = b

display :: Int -> String
display 1 = "Monday"
display 2 = "Tuesday"
display 3 = "Wednesday"
display 4 = "Thursday"
display 5 = "Friday"
display 6 = "Saturday"
display 7 = "Sunday"


main :: IO ()
main = interact (display . solve . parse)

tuplify' :: [a] -> (a, a)
tuplify' (x:xs) = (x, head xs)
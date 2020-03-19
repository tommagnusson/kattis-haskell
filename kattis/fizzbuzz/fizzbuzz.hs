parse :: String -> [Int]
parse = map read . words

-- x is Fizz
-- y is Buzz
-- x and y should be FizzBuzz
-- n print 1 to n
solve :: [Int] -> [String]
solve [x, y, n] = map (\a -> fizzbuzz [x, y, a]) n'
    where n' = [1..n]

fizzbuzz :: [Int] -> String
fizzbuzz [x, y, a] 
    | a `rem` x == 0 && a `rem` y == 0 = "FizzBuzz"
    | a `rem` x == 0 = "Fizz"
    | a `rem` y == 0 = "Buzz"
    | otherwise = show a


display :: [String] -> String
display = unlines

main :: IO ()
main = interact (display . solve . parse)

parse :: String -> Int
parse = read

solve :: Int -> (Int, Int)
solve 0 = (1,0)
solve n = (b, a + b)
    where (a,b) = solve (n - 1)

display :: (Int, Int) -> String
display (a, b) = show a ++ " " ++ show b

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

parse :: String -> [[(Int, Int)]]
parse s = undefined
    rs = lines s
    nLogs = filter ((>) 3 . length)) rs

parse' :: String -> [[Int]] -> String

solve :: a -> b
solve = undefined

display :: a -> String
display = undefined

main :: IO ()
main = interact (display . solve . parse)

example = "3\n20 2\n30 6\n10 7\n2\n60 1\n30 5\n4\n15 1\n25 2\n30 3\n10 5\n-1"

parse :: String -> [Char]
parse = map head . words

ranks = "A23456789TJQK"

solve :: [Char] -> Int
solve cs = maximum $ map (\x -> countOf x cs) ranks

-- finds the count of an element in a given list
countOf :: Eq a => a -> [a] -> Int
countOf a = length . filter ((==) a)

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)

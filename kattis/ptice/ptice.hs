import Data.List (sortBy)

parse :: String -> String
parse = head . tail . words

solve :: String -> [Int]
solve s = map (solve' s) [adrian, bruno, goran]

solve' :: String -> String -> Int
solve' as xs = length $ filter ((==) True) $ map (uncurry (==)) $ zip as xs

adrian = cycle "ABC"
bruno = cycle "BABC"
goran = cycle "CCAABB"

display :: [Int] -> String
display scores = show hi ++ "\n" ++ unlines high
    where
        desc = sortBy (\(_,x) (_,y) -> compare y x) $ zip ["Adrian", "Bruno", "Goran"] scores
        (_, hi) = head desc
        high = map fst $ takeWhile ((==) hi . snd) desc

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "5\nBAACC"
example2 = "9\nAAAABBBBB"

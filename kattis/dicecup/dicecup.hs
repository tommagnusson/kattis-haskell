import Data.List (group, sort)

parse :: String -> [Int]
parse = map read . words

solve :: [Int] -> [Int]
solve [n, m] = maxSums
  where
    sums = [p | n' <- [1..n], m' <- [1..m], let p = n' + m']
    groupedSums = group $ sort sums
    lengths = map length groupedSums
    maxLength = maximum lengths
    maxGroups = filter ((==maxLength) . length) groupedSums
    maxSums = map head maxGroups

display :: [Int] -> String
display = unlines . map show 

main :: IO ()
main = interact (display . solve . parse)
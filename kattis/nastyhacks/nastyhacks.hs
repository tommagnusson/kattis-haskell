data ShouldAdvertise = Yes | No | Doesntmatter

instance Show ShouldAdvertise where 
    show Yes = "advertise"
    show Doesntmatter = "does not matter"
    show No = "do not advertise"

parse :: String -> [[Integer]]
parse = (map ((map read) . words)) . tail . lines

solve :: [[Integer]] -> [ShouldAdvertise]
solve = map solve'

solve' :: [Integer] -> ShouldAdvertise
solve' [r, e, c] | a > r  = Yes
                 | a == r = Doesntmatter
                 | a < r  = No
                  where
                    a = e - c

display :: [ShouldAdvertise] -> String
display = unlines . map show

main :: IO ()
main = interact (display . solve . parse)
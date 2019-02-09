import Data.Char

parse :: String -> [Integer]
parse = (map read) . lines

solve :: [Integer] -> [Integer]
solve [l, d, x] = [min, max]
  where
    xs = [ z | z <- [l..d], digitSum z == x]
    min = head xs
    max = last xs

digitSum :: Integer -> Integer
digitSum = sum . (map (fromIntegral . digitToInt)) . show

display :: [Integer] -> String
display = unlines . (map show)

main :: IO ()
main = interact (display . solve . parse)

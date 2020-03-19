import Data.Bits

parse :: String -> [(Int, Int)]
parse = map (\x -> (read $ words x !! 0, read $ words x !! 1)) . lines

solve :: [(Int, Int)] -> (Int, Int)
solve [(x1, y1), (x2, y2), (x3, y3)] = (x', y')
    where 
        xs = [x1, x2, x3]
        ys = [y1, y2, y3]
        x' = foldr xor 0 xs 
        y' = foldr xor 0 ys 

        

display :: (Int, Int) -> String
display (x, y) = show x ++ " " ++ show y

main :: IO ()
main = interact (display . solve . parse)

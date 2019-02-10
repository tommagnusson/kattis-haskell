parse :: String -> ((Integer, Integer), [Integer])
parse s = (tuplify' $ tail $ words $ head ls, map read $ tail ls) 
  where
    ls = lines s

solve :: ((Integer, Integer), [Integer]) -> [Bool]
solve ((len, wid), ms) = map (((>=) space) . fromIntegral) ms
  where
    l = fromIntegral len
    w = fromIntegral wid
    space = sqrt (l^2 + w^2)

display :: [Bool] -> String
display = unlines . map display'

display' :: Bool -> String
display' True  = "DA"
display' False = "NE"

main :: IO ()
main = interact (display . solve . parse)

tuplify' :: [String] -> (Integer, Integer)
tuplify' (x:xs) = (read x, read $ head xs)
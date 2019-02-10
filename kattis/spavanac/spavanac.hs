parse :: String -> (Integer, Integer)
parse = tuplify' . words

solve :: (Integer, Integer) -> (Integer, Integer)
solve (h, m) = (h', m')
  where
    rawM = m - 45
    carry = (rawM) < 0
    m' = if carry then 60 + rawM else rawM
    h' = if carry then if h == 0 then 23 else h - 1 else h

display :: (Integer, Integer) -> String
display (h, m) = unwords [show h, show m]

main :: IO ()
main = interact (display . solve . parse)

tuplify' :: [String] -> (Integer, Integer)
tuplify' [] = undefined
tuplify' (x:xs) = (read x, read $ head xs)
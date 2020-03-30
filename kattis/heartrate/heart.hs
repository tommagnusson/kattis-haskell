parse :: String -> [[Double]]
parse = (map ((map read) . words)) . tail . lines

solve :: [[Double]] -> [[Double]]
solve = map solve'

solve' :: [Double] -> [Double]
solve' [b, p] = [bpm - d, bpm, bpm + d]
  where
    bpm = (60 * b) / p
    d = 60 / p

display :: [[Double]] -> String
display = unlines . map (unwords . (map show))

main :: IO ()
main = interact (display . solve . parse)

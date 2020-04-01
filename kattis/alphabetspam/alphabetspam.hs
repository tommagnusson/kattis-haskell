import Data.Char (isLower, isUpper, chr)
import Numeric (showFFloat)

isSpace :: Char -> Bool
isSpace '_' = True
isSpace  _  = False

isSymbol :: Char -> Bool
isSymbol c = elem c $ map chr $ [33..64] ++ [91..94] ++ [96] ++ [123..126]

parse :: String -> String
parse = head . words

solve :: String -> [Double]
solve s = map (\x -> x / l) [ws, lc, uc, ss]
    where
        l = fromIntegral $ length s
        ws = fromIntegral $ length $ filter isSpace  s
        lc = fromIntegral $ length $ filter isLower  s
        uc = fromIntegral $ length $ filter isUpper  s
        ss = fromIntegral $ length $ filter isSymbol s

display :: [Double] -> String
display = unlines . map (\d -> showFFloat (Just 10) (realToFrac d) "")

main :: IO ()
main = interact (display . solve . parse)

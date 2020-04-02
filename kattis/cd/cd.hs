import qualified Data.ByteString.Char8 as C
import Data.Maybe (fromJust)

type TestCase = ([Int], [Int])

parse :: C.ByteString -> [TestCase]
parse = parse' . C.lines . C.init . C.init . C.init . C.init

parse' :: [C.ByteString] -> [TestCase]
parse' [] = []
parse' (l:ls) = (jack, jill) : parse' rest
    where
        [jackN, jillN] = map (fst . fromJust . C.readInt) $ C.words l
        jack = map (fst . fromJust . C.readInt) $ take jackN ls
        jill = map (fst . fromJust . C.readInt) $ take jillN $ drop jackN ls
        rest = drop (jackN + jillN) ls

solve :: [TestCase] -> [Int]
solve = map solve'

solve' :: TestCase -> Int
solve' j
    | null xss || null yss = 0
    | x == y = 1 + solve' (xs, ys)
    | x >  y = solve' (xss, ys)
    | otherwise = solve' (xs, yss)
    where
        (xss, yss) = j
        (x:xs) = xss
        (y:ys) = yss

display :: [Int] -> C.ByteString
display = C.pack . unlines . map show

main :: IO ()
main = C.interact (display . solve . parse)

example = C.pack "3 3\n1\n2\n3\n1\n2\n4\n4 5\n1\n2\n3\n9\n1\n2\n4\n7\n9\n6 5\n1\n2\n3\n4\n5\n6\n0\n5\n6\n10\n11\n0 0\n"

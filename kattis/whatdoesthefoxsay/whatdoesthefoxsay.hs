import Debug.Trace (traceShowId)
import Data.Set (Set, empty, insert, notMember)
import Data.Maybe (fromJust)
import Data.List (uncons, genericIndex)

type Case = (String, [String])

parse :: String -> [Case]
parse = map parse' . casesByEnding "what does the fox say?" . tail . lines

parse' :: [String] -> Case
parse' = fromJust . uncons

solve :: [Case] -> [String]
solve = map solve'

solve' :: Case -> String
solve' (s, noises) = unwords filtered
    where
        set = noisesToSet noises
        ns = words s
        filtered = filter (flip notMember set) ns

noisesToSet :: [String] -> Set String
noisesToSet = foldr (\s set -> insert (noiseToValue s) set) empty

noiseToValue :: String -> String
noiseToValue = (flip genericIndex 2) . words

display :: [String] -> String
display = unlines

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

casesByEnding :: Eq a => a -> [a] -> [[a]]
casesByEnding s ss 
    | null x = []
    | otherwise = x: casesByEnding s (tail rest)
        where
           (x, rest) = break (== s) ss

example = "1\ntoot woof wa ow ow ow pa blub blub pa toot pa blub pa pa ow pow toot\ndog goes woof\nfish goes blub\nelephant goes toot\nseal goes ow\nwhat does the fox say?"

example2 = "2\ntoot woof wa ow ow ow pa blub blub pa toot pa blub pa pa ow pow toot\ndog goes woof\nfish goes blub\nelephant goes toot\nseal goes ow\nwhat does the fox say?\nHello man\nx goes man\nwhat does the fox say?"

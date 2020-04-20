import Debug.Trace (traceShowId)

import Data.Map.Strict (Map, fromList)
import qualified Data.Map.Strict as Map
import Data.Maybe (fromMaybe)

parse :: String -> (Map String String, [String])
parse s = (mp, ws)
    where
        (dict, (_:ws)) = break null $ lines s
        mp = fromList $ map (flipPair . words) dict

flipPair :: [String] -> (String, String)
flipPair [a, b] = (b, a)

solve :: (Map String String, [String]) -> [String]
solve (mp, ws) = map (solve' mp) ws

solve' :: Map String String -> String -> String
solve' mp w = fromMaybe "eh" $ Map.lookup w mp

display :: [String] -> String
display = unlines

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "dog ogday\ncat atcay\npig igpay\nfroot ootfray\nloops oopslay\n\natcay\nittenkay\noopslay"

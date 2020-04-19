import Text.Read (readMaybe)
import Data.Maybe (isNothing, fromJust)

parse :: String -> [Maybe Int]
parse = map readMaybe . tail . words

solve :: [Maybe Int] -> Bool
solve mis 
    | null rest = True -- all mumbles makes sense
    | length mumbles >= next = False -- the first heard number is too low
    | otherwise = solve' next $ tail rest
        where
            (mumbles, rest) = span isNothing mis
            next = fromJust $ head rest




solve' :: Int -> [Maybe Int] -> Bool
solve' _ [] = True
solve' last (Just next : rest) = if next - last /= 1 then False else solve' next rest 
solve' last (Nothing : rest) = solve' (last + 1) rest

display :: Bool -> String
display True  = "makes sense"
display False = "something is fishy"

run :: String -> String
run = display . solve . parse

main :: IO ()
main = interact run

example = "5\n1 2 3 mumble 5" -- correct
example2 = "8\n1 2 3 mumble mumble 7 mumble 8" -- incorrect
example3 = "3\nmumble mumble mumble" -- correct

example4 = "n\nmumble mumble mumble 2" -- incorrect

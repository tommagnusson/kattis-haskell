import Data.Maybe (fromJust)

type StringDigit = [String]
type StringLine = String 

parse :: String -> [Maybe String]
parse s = map (parseNumToValue . takeOutDigit ls) [0..(ndigits - 1)]
    where
        ls = lines s
        l = length $ head ls
        ndigits = l `div` 4 + 1

takeOutDigit :: [StringLine] -> Int -> StringDigit
takeOutDigit ls i = map (take 3 . drop (4 * i)) ls

solve :: [Maybe String] -> Bool
solve ss 
    | Nothing `elem` ss = False
    | otherwise = solve' $ foldr (++) [] $ map fromJust ss


solve' :: String -> Bool
solve' x = isDivBySix $ read x

isDivBySix :: Integer -> Bool
isDivBySix x = x `rem` 6 == 0 

display :: Bool -> String
display True  = "BEER!!"
display False = "BOOM!!"

main :: IO ()
main = interact (display . solve . parse) 

-- 5 rows and 3 columns
-- only '*'
-- length / 4 + 1 = how many numbers there are

-- get the [[String]] 

parseNumToValue :: StringDigit -> Maybe String
parseNumToValue n | zero == n = Just "0"
parseNumToValue n | one == n = Just "1"
parseNumToValue n | two == n = Just "2"
parseNumToValue n | three == n = Just "3"
parseNumToValue n | four == n = Just "4"
parseNumToValue n | five == n = Just "5"
parseNumToValue n | six == n = Just "6"
parseNumToValue n | seven == n = Just "7"
parseNumToValue n | eight == n = Just "8"
parseNumToValue n | nine == n = Just "9"
parseNumToValue _ = Nothing

-- for example:
twoThree = "*** ***\n  *   *\n*** ***\n*     *\n*** ***"
si1 = "***   * * * *** *** *** ***\n* *   * * *   *   *   * *  \n* *   * *** *** *** *** ***\n* *   *   * *     * *   * *\n***   *   * *** *** *** ***"

zero = 
    ["***",   
     "* *",   
     "* *",   
     "* *",   
     "***"]

one = ["  *",
        "  *",
        "  *",
        "  *",
        "  *"]

two = ["***",
        "  *",
        "***",
        "*  ",
        "***"]

three = ["***", 
        "  *",
        "***",
        "  *",
        "***"]

four = ["* *",
        "* *",
        "***",
        "  *",
        "  *"]

five = ["***",
        "*  ",
        "***",
        "  *",
        "***"]

six = ["***",
        "*  ",
        "***",
        "* *",
        "***"]

seven = ["***",
        "  *",
        "  *",
        "  *",
        "  *"]

eight = ["***",
        "* *",
        "***",
        "* *",
        "***"]

nine = ["***",
        "* *",
        "***",
        "  *",
        "***"]

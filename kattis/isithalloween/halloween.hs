parse :: String -> (String, Integer)
parse i = (head is, read $ last is)
  where is = words i

solve :: (String, Integer) -> Bool
solve ("OCT", 31) = True
solve ("DEC", 25) = True
solve (_,_)       = False

display :: Bool -> String
display True  = "yup"
display False = "nope"

main :: IO ()
main = interact (display . solve . parse)
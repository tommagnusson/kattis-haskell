province = 8
duchy = 5
estate = 2

gold = 6
silver = 3
copper = 0

parse :: String -> [Integer]
parse = map read . words

solve :: [Integer] -> (String, String)
solve [g, s, c] = (victory b, treasure b)
  where
    b = 3 * g + 2 * s + c

victory :: Integer -> String
victory b | b >= province = "Province"
          | b >= duchy    = "Duchy"
          | b >= estate   = "Estate"
          | otherwise     = ""

treasure :: Integer -> String
treasure b | b >= gold   = "Gold"
           | b >= silver = "Silver"
           | otherwise   = "Copper"

display :: (String, String) -> String
display ("", t) = t
display (v, t)  = v ++ " or " ++ t

main :: IO ()
main = interact (display . solve . parse)
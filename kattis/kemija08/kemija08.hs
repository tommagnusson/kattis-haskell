parse :: String -> String
parse = head . lines

solve :: String -> String
solve ('a':'p':'a':xs) = 'a': solve xs
solve ('e':'p':'e':xs) = 'e': solve xs
solve ('i':'p':'i':xs) = 'i': solve xs
solve ('o':'p':'o':xs) = 'o': solve xs
solve ('u':'p':'u':xs) = 'u': solve xs
solve (x:xs) = x: solve xs
solve "" = ""

display :: String -> String
display = id

main :: IO ()
main = interact (display . solve . parse)

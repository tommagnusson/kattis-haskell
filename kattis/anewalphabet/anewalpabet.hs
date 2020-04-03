parse :: String -> String
parse = id

solve :: String -> String
solve = concatMap solve'

solve' :: Char -> String
solve' 'a' = "@"
solve' 'A' = "@"
solve' 'b' = "8"
solve' 'B' = "8"
solve' 'c' = "("
solve' 'C' = "("
solve' 'd' = "|)"
solve' 'D' = "|)"
solve' 'e' = "3"
solve' 'E' = "3"
solve' 'f' = "#"
solve' 'F' = "#"
solve' 'g' = "6"
solve' 'G' = "6"
solve' 'h' = "[-]"
solve' 'H' = "[-]"
solve' 'i' = "|"
solve' 'I' = "|"
solve' 'j' = "_|"
solve' 'J' = "_|"
solve' 'k' = "|<"
solve' 'K' = "|<"
solve' 'l' = "1"
solve' 'L' = "1"
solve' 'm' = "[]\\/[]"
solve' 'M' = "[]\\/[]"
solve' 'n' = "[]\\[]"
solve' 'N' = "[]\\[]"
solve' 'o' = "0"
solve' 'O' = "0"
solve' 'p' = "|D"
solve' 'P' = "|D"
solve' 'q' = "(,)"
solve' 'Q' = "(,)"
solve' 'r' = "|Z"
solve' 'R' = "|Z"
solve' 's' = "$"
solve' 'S' = "$"
solve' 't' = "']['"
solve' 'T' = "']['"
solve' 'u' = "|_|"
solve' 'U' = "|_|"
solve' 'v' = "\\/"
solve' 'V' = "\\/"
solve' 'w' = "\\/\\/"
solve' 'W' = "\\/\\/"
solve' 'x' = "}{"
solve' 'X' = "}{"
solve' 'y' = "`/"
solve' 'Y' = "`/"
solve' 'z' = "2"
solve' 'Z' = "2"
solve'  c  = [c]

display :: String -> String
display = id

main :: IO ()
main = interact (display . solve . parse)

import Data.List (isInfixOf, transpose)

type Subrow = [Char]
type Row = [Char]
type Column = [Char]
type Board = [Row]

parse :: String -> (Board, [Subrow])
parse s = (take nRows (tail b), drop nRows (tail b))
  where
    nRows = read $ head $ words $ head $ lines s
    ls = map words $ lines s
    b =  map head ls
  
-- head of the head is the number of rows in the board
-- the rest is the search space

solve :: (Board, [Subrow]) -> Int
solve = undefined

solveColumns :: Board -> [Subrow] -> [Int]
solveColumns b srs = solveRows (rotate b) srs

solveRows :: Board -> [Subrow] -> [Int]
solveRows b srs = map solveRow $ cart b srs

solveRow :: (Row, Subrow) -> Int
solveRow (r, sr) = convert $ sr `isInfixOf` r

cart :: [a] -> [b] -> [(a,b)]
cart xs ys = [(x, y) | x <- xs, y <- ys]

rotate45 :: [[a]] -> [[a]]
rotate45 = undefined

singletons :: [a] -> [[a]]
singletons = map (:[])

pad :: Int -> [[a]] -> [[a]]
pad = undefined

-- https://stackoverflow.com/questions/19625146/list-of-list-turn-90-degrees-in-haskell
rotate :: [[a]] -> [[a]]
rotate = reverse . transpose

-- Solve the rows, which constitutes the board

convert :: Bool -> Int
convert True = 1
convert False = 0

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)
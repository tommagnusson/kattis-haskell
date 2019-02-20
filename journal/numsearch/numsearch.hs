import Data.List (isInfixOf)

type Subrow = [Char]
type Row = [Char]
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

solveRows :: [Row] -> [Subrow] -> [Int]
solveRows rs srs = concat $ map ((map convert) . (solveRow srs)) rs

solveRow :: [Subrow] -> Row -> [Bool]
solveRow srs r = map ((reverse isInfixOf) r) srs

-- Solve the rows, which constitutes the board

convert :: Bool -> Int
convert True = 1
convert False = 0

display :: Int -> String
display = show

main :: IO ()
main = interact (display . solve . parse)
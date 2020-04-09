import Debug.Trace (traceShowId, trace, traceShow)

import qualified Data.ByteString.Char8 as C

import Data.IntSet (IntSet, member, union, insert, fromAscList, foldl')
import qualified Data.IntSet as IntSet

import Data.IntMap.Strict (IntMap)
import qualified Data.IntMap.Strict as IntMap

import Data.Maybe (isJust, isNothing, fromJust, fromMaybe)
import Data.Function (on)

import Data.List (sort)

type Op = (C.ByteString, (Int, Int))

parse :: C.ByteString -> [Op]
parse = map (parse' . C.words) . tail . C.lines

parse' :: [C.ByteString] -> Op
parse' [c, a, b] = (c, ((,) `on` (fst . fromJust . C.readInt)) a b)

solve :: [Op] -> [Bool]
solve ops = solve' ops IntMap.empty 

solve' :: [Op] -> IntMap IntSet -> [Bool]
solve' [] _ = []
solve' ((c, ab):ops) m 
    | c == qMark = query ab m : solve' ops m -- O(n)
    | otherwise = solve' ops $ join ab m -- O(n^2)

query :: (Int, Int) -> IntMap IntSet -> Bool
query (a, b) _ | a == b = True
query (a, b) m = fromMaybe False $ fmap (member b) $ IntMap.lookup a m

-- O(n)
join :: (Int, Int) -> IntMap IntSet -> IntMap IntSet
join (a, b) m 
    | a == b = m -- by definition in same set
    | query (a, b) m = m -- already in the same set
    | needsNewSetAB m a b = foldl' (updateM newSetAB) m newSetAB -- a and b are both not in sets
    | needsAToB = addAtoB m a b
    | needsBToA = addAtoB m b a
    | otherwise = m' -- sets containing a and b must be joined
        where
            -- lookups
            areInSameSet = fromMaybe False $ fmap (member b) $ IntMap.lookup a m

            needsAToB = aNeedsAddToB m a b
            needsBToA = aNeedsAddToB m b a 

            -- for a and b are both not in sets
            newSetAB = fromAscList $ if a < b then [a, b] else [b, a]

            -- for otherwise
            setA = IntMap.lookup a m -- O(min(n,W))
            setB = IntMap.lookup b m -- O(min(n,W))
            setAB = (union `on` fromJust) setA setB -- got union of both sets
            m' = foldl' (updateM setAB) m setAB -- update the keys in the IntMap to this new unioned set TODO: optimize! only need to go through setA or setB!

needsNewSetAB :: IntMap IntSet -> Int -> Int -> Bool
needsNewSetAB m a b = (not $ IntMap.member a m) && (not $ IntMap.member b m)

aNeedsAddToB :: IntMap IntSet -> Int -> Int -> Bool
aNeedsAddToB m a b = (not $ IntMap.member a m) && IntMap.member b m

addAtoB :: IntMap IntSet -> Int -> Int -> IntMap IntSet
addAtoB m a b = m'
    where
        setB = fromJust $ IntMap.lookup b m
        setAB = insert a setB
        m' = foldl' (updateM setAB) m setAB -- update all the keys in IntMap TODO: EXPENSIVE

-- This is why it's so expensive
updateM :: IntSet -> IntMap IntSet -> Int -> IntMap IntSet
updateM v m k = IntMap.insert k v m

display :: [Bool] -> C.ByteString
display = C.unlines . map display'

display' :: Bool -> C.ByteString
display' True = C.pack "yes"
display' False = C.pack "no"

run :: C.ByteString -> C.ByteString
run = display . solve . parse

main :: IO ()
main = C.interact run

qMark = C.pack "?"

example1 = "10 4\n? 1 3\n= 1 8\n= 3 8\n? 1 3"

example2 = "4 5\n? 0 0\n= 0 1\n= 1 2\n= 0 2\n? 0 3"

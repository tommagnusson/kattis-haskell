# Entry 04

## Feb 11

## Exploration

- Conjure the list of positive, even integers up to 10...

  - using only the `(:)` sigil, `[]`, and number literals
    - `2:4:6:8:10:[]`
  - using the `filter` spell on the list `[1..]`
    - `take 6 $ filter even [1..]`
  - ## using a list comprehension
    - `[x | x <- [1..10], even x]`

- Conjure the list of the first 10 [square numbers](https://en.wikipedia.org/wiki/Square_number)...
  - using only the `(:)` sigil, `[]`, and number literals
    - `0:1:4:9:16:25:36:49:64:81:100:[]`
  - by casting the `take` spell on the appropriate list comprehension
    - `take 11 $ [y | x <- [0..], let y = x^2]`

* Conjure the list of [triangular numbers](https://en.wikipedia.org/wiki/Triangular_number)...

  - using explicit recursion and the `(:)` sigil
    ```haskell
    triN 0 1 = 0
    triN n m = m - n
    tris = t:(tri t)
      where t = triN +
    ```
  - using a list comprehension
    - `[x | y <- [0..], let x = (y * (y + 1)) / 2]`

* From the String `"The quick brown fox jumps over the lazy dog."`, get each of the following words:
  - `"The"`
    - `take 3 "The quick brown fox jumps over the lazy dog."`
    - `zipWith (\x y -> y !! x) [0..2] $ repeat "The quick brown fox jumps over the lazy dog."`
  - `"fox"`
    - `take 3 $ drop 16 "The quick brown fox jumps over the lazy dog."`
    - `zipWith (\x y -> y !! x) [16..18] $ repeat "The quick brown fox jumps over the lazy dog."`
  - `"dog"`
    - `reverse $ tail $ take 4 $ reverse "The quick brown fox jumps over the lazy dog."`
    - `zipWith (\x y -> y !! x) [40..42] $ repeat "The quick brown fox jumps over the lazy dog."`

### Removing a list element

Devise a spell that will remove from a list the element at a given position. Of course, you cannot destroy the original list in Haskell, so really you must create a new list that appears just as the original except that it does not contain that element which appears in the original list at the given position.

```haskell
remove :: a -> [a] -> [a]
remove _ [] = []
remove e (x:xs) | x == e    = xs | otherwise = (x:(remove e xs))
```

### Replacing an element

Devise a spell that will replace a list element at a specific index with some new value. Of course, you cannot destroy the original list, so really you must create a new list that appears just as the original except in the specified position.

```haskell
replace :: a -> [a] -> Int -> [a]
replace _ [] _ = []
replace y (x:xs) i | i == 0 = (y:xs) | otherwise = (x:(replace y xs (i-1)))
```

### Median value

Devise a spell to compute the median value of a list of numbers. Be sure to make the type constraint as general as possible while still correctly implementing the notion of median.

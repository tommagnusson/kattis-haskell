# Entry 12

## March 29

# Subset Sum - Using recursion

I decided to try to apply my Haskell skills to my algorithms course because we're going over divide and conquer recursive algorithms and I think Haskell is a perfect way to express these problems.

We're doing the subset sum problem which states: given a set of non-negative integers A and a sum s, write a recursive algorithm to find whether or not there exists a subset B of A such that the sum of every b in B equals s.

My implementation can be found in subsetsum.hs. I had fun trying to practice using the different types of pattern matching and guard statements. I like the fact that you can pick and choose what kind of statements you want to use (if vs. guard, for example).

We also worked on a problem of searching an array for the string "yes" recursively. I initially had the function return an `Int` by itself, but I quickly realized that returning `-1` is sort of a cop-out, and that I should really be returning `Maybe Int` so that the caller can appropriately deal with `Nothing`. My implementation can be found in findYes.hs.

Questions:

- When should I use `Maybe` vs. returning a default value? Is `Maybe` favored? Is there any impact on relying on an additional `Data.Maybe` module?
-

# Entry 21

## May 8

# Subset Sum and Minmax Algorithms

In Algorithms class we focused on the subset sum problem and the minmax algorithm.

## Minmax

Bowu mentioned that this algorithm is super useful in programming interviews, and will likely show up at least once when interviewing for a bunch of companies. Though the problem definition changes slightly (max and max2, min and min2), the core formula remains the same: find the minmax of each half of the list. This problem falls prey to the same issue with mergesort's naive implementation; in order to split the list in half, one must first find the length of the array (which is an O(n) running time) and also walk the list and split the list in two (another O(n)). The array version of this algorithm does not have those running time additions, as the length is cached and array access is constant time.

One side note is that I really like the pattern matching decomposition of tuples in the `where` clause because it looks so intuitive. Of course `(left, right) = splitAt half xs` because the left half is the left part of the tuple and the right half is the right part of the tuple. It reminds me a lot of JavaScript's new array destructuring and spread operator, where you can go like `const [first, rest...] = xs` and the variable `first` will be created as just the first element, while `rest` will contain the remaining elements. I'm sure somewhere in the development of the feature someone who worked with Haskell or a language inspired by Haskell was present.

## Subset Sum

Given a sorted list, find out whether there are a subset of positive integers that add up to a given sum. This is a NP-Complete problem, according to Bowu, with a running time of O(n^2) I believe, and ends up with an excellent solution in Haskell, in my opinion. We have a base case where the element equals the sum, and two general cases where if the element is larger than the given sum exclude it and search the rest of the list, or if the element is less than the sum, search both for a remaining solution in the rest of the list twice: one with the element subtracted for the sum (for a subset that contains that element) and one without the subtraction (for a solution that does not contain that element in the subset).

Overall, I think the beauty of Haskell's beauty shines through. I used a variety of convenient language constructs, such as pattern matching and guard statements. Those two alone, as well as recursion, are pretty much the building blocks to make any recursive algorithm concise.

As a meta note, it seems there is a tradeoff between prior knowledge of a language and its ability to be concise. Because there are a lot of language constructs based on some pretty complicated fundamentals (mostly mathematical notation) it can seem really obscure. It might seem more clear written out in a longer form, perhaps using the familiar if-else statements. If one understands those language constructs, however, the longer form seems tediously verbose and the language constructs offer a more concise denotation. Readers must leverage prior understanding to gain a concise representation. I think it's interesting how concise Haskell can be, and how much knowledge I've accumulated in order to appreciate its conciseness.
# Entry 18

## April 27

# Weekly - Continuing Algorithmic Explorations

We've explored some more interesting algorithms in the course, and they seem particularly suited for Haskell. One of them is the mergesort, which requires an understanding of the merge algorithm as well. One of the challenges of implementation that I seemed to struggle with was the way in which I can avoid (or not) walking the linked list to split it in half each iteration, which is an O(n) operation, unfortunately, and deteriorates the running time from the nice O(nlogn) to O(n^2). Calculating the length of the list also deteriorates the running time and adds a constant factor of n to the concrete running time, unfortunately.

My naive implementation includes this `splitAt half` because that's the imperative way we learned it, but researching online there seems to be a different way of solving the problem... one that is more complex but more efficient. If I can walk along the array and make each element a singleton list, I can then merge them together to form the list I need without ever having to split the list in half, because I would already be at the smallest lists possible.

See the `mergesort` folder for my naive implementation.

Questions:
- How does the actual mergesort work in Haskell?
- What optimizations were added to make it as fast as it is?
- Are there data structure that support Quicksort? (It doesn't seem like the default linked lists are suitable for that algorithm)




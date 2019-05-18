# Entry 16

## April 20

# Weekly - Integrating Haskell into Algorithms Course

I've started to see if I can use Haskell to implement the algorithms I've been learning in my Introductions to Algorithms class. We're starting to learn recursive algorithms as a topic, in the divide-and-conquer genre of problem solving tools. I took this opportunity to compare the Haskell implementations of recursion against the more traditional imperative style of recursion, and the results are pretty clear that Haskell seems to be a less obvious but way more compact style of programming.

In our Algorithms course, we've learned the two parts of a recursive method:

```
recursiveFunction(p1, p2,..., pN) {
  if(baseCase(p1, p2, ..., pN)) {
    return // some base case, usually some O(1) operation
  }
  if(generalCase1(p1, p2, ..., pN)) {
    return recursiveFunction(p1', p2', ..., pN')
  } else if (...) {
    //...
  } else if(generalCaseN(p1, p2, ..., pN)) {
    return recursiveFunction(p1', p2', ..., pN')
  }
}
```

The classic `if-else if` structure dominates the imperative model. Though Haskell has such a structure, it's wayyyy more common to implement recursive functions using pattern matching the arguments, or at least guard statements:

```Haskell
recursiveFunction baseCase(p1, p2, ..., pN) = // base case, usually O(1)
recursiveFunction generalCase1(p1, p2, ..., pN) = // some expression with recursiveFunction called again
recursiveFunction generalCaseN(p1, p2, ..., pN) = // ...
```

It seems more succinct and a bit clearer without all the braces.

The one thing with Haskell that I find a bit challenging is algorithms that benefit from the iterative style of solution, particularly those that use constant-time array accesses. In my research I've definitely come across data structures that mirror those of arrays, however it seems cumbersome and entirely "non Haskellian" to do so, because such accesses and mutations are contrary to the functional style. 

Questions:

 - How do we use array-like data structures to ensure O(1) accesses? Mutations?
 - What is tail recursion? I've heard that it helps with performance in research, however I'm not sure what that means.
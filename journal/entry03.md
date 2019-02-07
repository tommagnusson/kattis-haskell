# Entry 03

## Feb 4

## Kattis

I'm doing the **freefood** problem on Kattis and I'm approaching it using a `Set` and it seems Haskell has a lot of interesting ways of treating data structures and its methods.

There are two main set types:

- `Data.Set`
- `Data.IntSet`

I think I just need the first one because I'm using `Integer`s, not `Int`s.

I'm learning about how to import the data structure using `import Data.Set as Set` alias and then using `Set.fromList [1, 2]` constructor. Seems like very nice object-oriented style dot notation to access a constructor, very fluid, though I know it's not quite "object oriented" in the Java traditional sense.

The `Set.union` function is quite useful to me because I need to count the unique elements in a bunch of lists turned into sets (to figure out how many singular days there was free food served, according to the problem.)

Eww, apparently importing the `Set` module imports a function called `map` as well, which conflicts with `Prelude.map`, meaning all the Prelude maps I use have to be prefixed... I wonder if there's a way to avoid that namespace collision... (I would think requiring `Set.map` would have already solved that and assuming that `Prelude.map` is the implicit one?)

Lots of the error messages of the compiler seem to be overly helpful. I have to cut through a long enumeration of expression portions in order to figure out what the compiler is actually erroring on, and it's quite difficult to debug a number of problematic lines every time... I get lost in the number of errors that occur. I think that's something I have to work on.

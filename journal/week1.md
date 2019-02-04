# Week Two

## Jan 22

## Exploration

I'm trying out some practice Kattis problems, just the easy ones, to help me get around the syntax of Haskell. I can read Haskell okay... I've done some programming in it for Alan's Theory of Programming Languages class, and it was by far the language that took me the most to program the Caesar Cipher, however it was the most interesting and what I felt like the most rewarding.

I'm attempting to do the Pizza Crust problem and I'm running into some type errors:

```
pizza_crust.hs:14:14: error:
    • Couldn't match expected type ‘Double’ with actual type ‘Integer’
    • In the expression: pi * (r ^ 2)
      In an equation for ‘calcArea’: calcArea r = pi * (r ^ 2)
```

Here's the code:

```Haskell
calcArea :: Integer -> Double
calcArea r = pi * (r ^ 2)
```

I don't understand why Haskell thinks that this function will return an integer. I've done `:t` on `pi` and it's returned `Floating`... which I assume could be automatically considered a `Double`, however apparently not. I'm used to the type hierarchy of something like Java which automatically can cast something `Floating` to `Double`... I don't understand why Haskell is getting a type mismatch.

I've tried in the GHC to provide examples of expressions of the `calcArea` body, and all has checked out. I can successfully use `pi` in combination with `Integer`s to create a `Double` value, but for some reason the compilation process reads the `calcArea` function and its type definition differently than in GHC.

If I change the definition of `calcArea` to `Integer -> Integer` the error moves on to a different function... What the heck man??

I changed the definition to `Integer -> Float` and still nothing... maybe it has something to do with the `^` operator? Or the `*` operator?

Nope, in GHC:

```haskell
calcArea r = pi * r ^ 2
:t calcArea
calcArea :: Floating a => a -> a

calcArea :: Integer -> Double

<interactive>:32:1: error:
    • Couldn't match type ‘Integer’ with ‘Double’
      Expected type: Integer -> Double
        Actual type: Double -> Double
    • In the expression: calcArea :: Integer -> Double
      In an equation for ‘it’: it = calcArea :: Integer -> Double
```

So the inferred type of calcArea is important: `Floating a => a -> a`, meaning that whatever type `a` is defined in the first argument, the output of the function must be the same type. So because I've defined `calcArea` as `Integer -> Double` Haskell reads the input type, `Integer`, and expects the output to also be an `Integer`. Why is is happening, I still don't understand. I have a feeling `pi` is some fancy function-like "value" that messes up the types, because it is type `Floating a`. I don't know how to change the type expected, because I should be able to polymorphically get a function `Floating a => Integer -> a` where `a` is a `Double` (that makes sense right? A `Double` is `Floating`? Let's look it up.)

I thought Haskell's type system would be smart enough to just convert automatically, but I guess not. I needed `fromIntegral` to change the result of `r ^ 2` to a more general type, `Num`, which `pi` could be multiplied with to produce a `Double`... I guess?

## Summary

I've learned a lot about numeric types, namely the subtle differences between `Num` and `Floating` and `Double` and `Integer` and all those.

I've also learned somewhat about pattern matching with arrays... although I also learned that you have to be exhaustive for all possible sizes of arrays, even if those sizes are impossible given the problem definition. This forced me to make awkward cases like `f [] = error "impossible"` and the like. I don't really know how to cleanly destructure the first two elements in an array into a `Pair` or `Tuple`.

I learned that the `!!` operator is unsafe and throws runtime exceptions, which is pretty bad for Haskell (which is supposed to catch most errors before the program is compiled even).

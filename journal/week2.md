# Week Two

## Feb 4

## Lots of Lists

I learned a bit about list functions and how to access different nodes within a list.

Notably, `head`, `tail`, `init`, `last`, and all those in the `List` module.

I tried out `head []` in GHCI to find a runtime exception! I thought Haskell didn't have those! I guess I better be careful with empty lists.

Oh man, `tail []` also throws a runtime exception as well. I would expect perhaps `[]` or something of that nature.

In fact, they all throw runtime exceptions. It seems these functions are dangerous :(

## Exploration

> Repetition is the essence of machine.

### Arithmetic operators

I know how to use most arithmetic operators, but I know that `/` is only for `Fractional` classes, which `Integer` does not adhere to (that's not its domain). But GHCI interprets `3 / 3` as two fractionals.

`quot` and `div` seem interesting. There are subtle differences to each that I don't really care about now, but I'm sure I'll come across them when trying to divide numbers in the future. Likewise with `rem` and `mod`. I guess `rem` doesn't result in negative numbers when the second arg is negative, according to Stackoverflow.

### Mapping

I don't really know why one would use `map null` at all. Seems like it throws a runtime exception.

Upon further inspection looks like `null` tests for empty things, like empty lists. Nice. I would prefer something like `isNull` but seems like Haskell favors shorter rather than clearer names.

### Arithmetic Expressions

So we define f as follows

```haskell
f x = x * x - 1
```

- `f(2) + 1 == 4`
- `f (3 + 2) == 24`
- `f 1 + 5 == 5`
- `f 0 + f 2 == 2`
- `5 - f 2 == 2`
- `f f 1` Runtime exception, because we need `f . f` to compose the functions like we intuitively though, otherwise Haskell thinks `f` is trying to take in `f` as a higher order function.

### Mapping

- `map negate [1, 2, 3, 4]`
- `map toLower "STRING"`
- `map (*3) [1,2,3]`
- `map toUpper "string"`
- `map ((-)1) [1,2,3]` tricky unary vs partially applied infix `-`
- `map length ["Olorin","Curumo","Aiwendil"]
- `map even [0,1,1,2,3,5,8]`

## Exploration reflections

I like GHCI. It's a nice environment to learn quickly. It's the closest peice of software to Chrome Developer Tool's JavaScript console.

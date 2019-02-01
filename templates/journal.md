# Week One

## January 22

We learned about the GHCi tool today. From the command prompt of shell, running the command `ghci` launches a REPL (Read-Evaluate-Print-Loop) which provides an interactive environment in which we can experiment and test Haskell code. The GHCi environment also provides additional help functionality, such as asking for the _type_ of a function or value using `:t`.

One thing about GHCi that we should remember is that it always prints the resulting value of any expression we type in, even if that code doesn't specifically say to print it. Professor says that this is different than when the code itself actually instructs the machine to print to the console. For example, if I type `"Hello World"` at the GHCi prompt, then the REPL prints `"Hello World"`. However, if I enter `putStrLn "Hello World"`, then the output looks like `Hello World` with no quotation marks.

Etc...

### New Reserved Operators

- `(::)` used when specifying the type of a name or symbol
- `(=)` a binding operator, used to define a name
- `(->)` arrow operator, used when specifying function types

### New Operators

- `(+)` addition operator, adds two numbers in the expected way
- `(++)` append operator, joins two strings together
- `(.)` function composition, first function takes as input the output of the second function

### New Named Functions

- `mod` modulus function
- `map` applies a given function to each element of a list to produce a new list, may be used instead of a loop when that loop would transform a list
- `interact` takes a function that transforms a string into a new string, gets keyboard input and passes it to the specified function then prints the result to the console
- `putStrLn` prints output to the console, similar to Java's System.out.println

## Exploration

On my own outside of class, I installed the Haskell Platform on my personal laptop and launched GHCi to play around a bit, tryin out some simple expressions.

- `4 + 2` produced `6`
- `2 - 1` produced `1`
- `2 * 4` produced `8`

I encountered my first error when I tried joining a number and a string as we might do in languages like Java and JavaScript. When I entered the expression `200 + "px"` (something I might use in JavaScript on the Web), I received the following message:

```
<interactive>:4:5:
    Couldn't match expected type `Integer' with actual type `[Char]'
    In the second argument of `(+)', namely `"Hello"'
    In the expression: x + "Hello"
    In an equation for `it': it = x + "Hello"
```

I'm not entirely sure what this is telling me yet, but it seems like the data types matter when adding things with `+`.

Etc...

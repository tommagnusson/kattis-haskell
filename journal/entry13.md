# Entry 13

## April 1

# Lab - Proof

`P(xs, ys): reverse (xs ++ ys) = reverse ys ++ reverse xs`

| proof name          | definition                          |
| ------------------- | ----------------------------------- |
| reverse.1           | `reverse [] = []`                   |
| reverse.2           | `(x:xs) = reverse xs ++ [x]`        |
| (++).1              | `[] ++ ys = ys`                     |
| (++).2              | `(x:xs) ++ ys = x: xs ++ ys`        |
| (++).right-identity | `xs ++ [] = xs`                     |
| (++).associativity  | `xs ++ ys ++ zs = (xs ++ ys) ++ zs` |

```
P([], [])
```

I think I got this right... but I'm not sure if I need to replace both the xs and ys with [] because sometimes we just replace xs and ignore ys... or have ys. I'm going to stick with replacing both and see how far that gets me.

| `reverse ([] ++ [])` | `reverse [] ++ reverse []` |
| -------------------- | -------------------------- |
| `{(++).1}`           | `{reverse.1 * 2}`          |
| `reverse []`         | `[] ++ []`                 |
| `{reverse.1}`        | `{(++).1}`                 |
| `[]`                 | `[]`                       |

That looks good. I have the same answer for the empty list. Now to formulate the inductive hypothesis.

`IH: P(xs, ys) -> P(x:xs, ys)`

| `reverse ((x:xs) ++ ys)`    | `reverse (ys) ++ reverse (x:xs)`    |
| --------------------------- | ----------------------------------- |
| `{(++).2}`                  | `{reverse.2}`                       |
| `reverse (x:(xs ++ ys))`    | `reverse ys ++ reverse xs ++ [x]`   |
| `{reverse.2}`               | `{(++).associativity}`              |
| `reverse (xs ++ ys) ++ [x]` | `(reverse ys ++ reverse xs) ++ [x]` |
| ` `                         | `{IH}`                              |
| ` `                         | `reverse (xs ++ ys) ++ [x]`         |

Implement a Vector module containing
 - Vec3 data type
 - Make Vec3 an instance of the following classes
   - Eq
   - Num
   - Show
 - Implement additional operations...
   - magnitude
   - normalize
   - scalar product
   - dot product
   - cross product

# Entry 04

## Feb 15

## Kattis

I've learned a great deal about the Haskell language over the course of solving a decent number of Kattis problems that has quickly boosted my score.

I find myself addicted to hoisting myself up the Marist Kattis ladder, and I love to feel the satisfaction of solving questions.

One of the early issues I had in submission was displaying a simple result. The answer to a `solve` function was already a `String`, so I simply changed the `display` function to `show`, because I thought that was equivalent to the `id` function for Strings (of course a string would just show itself, right?). Well that cost me a large number of sumbissions for me on that problem, because I realized `show`ing a string actually meant adding `"` around it. I didn't see this in my local tests at first because the output looked identical except for that stupid ending line feed difference (which I wish was a flag I could disable as a check). I didn't realize the output was wrapped in quotes for like three or four submissions, but now I'll never make that mistake again!

One of the really cool functions I love is the `flip` function, which flips the order of the arguments to a function. It's quite useful in combination with partial application for something like a `map` because it allows partial application of a function whose order might not exactly match the way I've set up the problem, but instead of changing all of my implementations, I can just `flip` the arguments and all is well.

One of the most frustrating problems I ran into had less to do with the language, and more with the version of GHC I had. I was attempting to solve `datum` which required me to parse a string that represented the month and day of a date in 2009 and output that day of the week. So it was pretty much an excersize in discovering the date package of whatever language you're using. I looked up the `Data.Time` packages and whatnot, and I found a really nice `WeekDay` data type with a function that converted a date into a `WeekDay`, and the one to output that `WeekDay` as a string. When I attempted to import the package, the `WeekDay` function did not exist! It turns out I was using an older verion of GHC which contained an older version of all the `Data.Time` modules... and there existed no `WeekDay` nice constructor in the older version. So I switched the documentation version to the version I was on and manually created a simple `WeekDay` converter based on a weekday number dervied from another function. I learned to use the `:browse` function in GHCI to examine what functions were available within a given package, which was useful at determining my incompatibility with the documentation I was looking at online.

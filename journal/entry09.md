# Entry 09

## March 10

# Explorations with DiceCup

I'm attempting to solve the Dice Cup problem on Kattis. Though it's low ranked, I think it's a great refresher for list comprehension syntax because my solution involves computing all the possible sums of two n and m sided dice and picking the highest occurring ones, essentially computing the mode.

This problem looks a little trickier that I initially thought. I'm going to break it into sub problems:

1. Parse the input into a list of two Integers, n and m
2. Create lists from 1 to n and 1 to m respectively to represent all the values on each die
3. Join the newly created lists together using cartesian product via list comprehension, creating pairs of possible two dice "rolls"
4. Sum all the pairs together
5. Group by identical numbers
6. Find the largest group and sort it \*
   1. \* Initially I had this step, and then I realize that I need to find the max of the lengths of the groups
   2. Get all the groups that have this length
   3. Condense those groups down into the singular number each represents
   4. Sort that condensed list
7. Display that sorted largest group as the answser, each on a different line

Though this brute force approach feels a little expensive, I remind myself that Haskell is lazy and efficient and all that. Hopefully that speeds up all these cartesian products and sums over lists... n and m are never more than 20 though, so that shouldn't be too bad, no more than 400 pairs I think, easy peasy.

You know what I really hate? All this manual casting. I know I complained about this in one of my previous journals, but I really had how Haskell treats numbers. I don't care about `Int` vs `Integer`, just please define `==` and `+` and all those other operators to account for these concrete types without my having to cast everything or figure out all of these different ways to make the compiler happy. If I'm compoaring an `Int` and an `Integer` using `==` it should just work! I guess I don't understand why I have to cast these to classes in order for equality to work... It seems like `==` should just implement `Int -> Integer -> Bool` and `Integer -> Int -> Bool`... why is that not included in the Prelude equality with numerics?

Whatever, I'll just change everything to `Int` because `length` returns `Int` and I'll just have to deal..

Note: `max` !== `maximum`

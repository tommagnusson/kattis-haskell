# Entry 08

## March 2

# Explorations with the Example Kattis Problem

I'm playing around with the solution we constructed in the lab for the Kattis problem: Goat Rope.

I've used the test files to test the solution we had on the board, and it seem to match up to the expected `.in` files. That's a very good sign, however I want to focus on polishing the answer to make sure that I understand all the possible ways of extending this problem if needed be.

I think it's largely a shame that these Kattis problems seem to require only a limited amount of extensibility to solve. There are usually sharply defined problem domains. I think it's quite a great introduction to a language because it forces us to understand the language rather than just focus on problem solving large domains. I do think, however, that there is an element of elegantness that is missing from the solutions required. I suppose any solution to any problem might be able to be presented myriad ways, but for some reason I always seem to solve them by focusing on my own quick interpretation of the question, and then writing the solution that is specific to that particular question. I think Haskell might also be a great tool for extensibility, however none of the Kattis problems I've done so far (And that I deem are approachable) have bridged the gap between simple problem solving and creating a solution extensible for use in many different contexts.

So I'm going to use this example that we've already solved to attempt to present it in a more extensible way. One immediate aspect of the solution I noticed was the duplicate lines for x and y respectively. Lines in the `where` clause seemed to mirror one another; it seems like a great avenue to provide a helper function that reduces redundancy.

Ironically, it might be the case that in an attempt to factor out part of the duplicate lines I put more lines in the "factored out" solution than in the original "unfactored out" solution. I think in the long run this is a better approach to solving less specific problems such as those on Kattis. I'm eager to learn how Networking and Parallelization work in Haskell, and how such a "pure" language can solve "impure" problems. Alas, let's start with factoring out the x and y duplicate code.

One common question I run into when defining functions that are meant to take multiple arguments is whether to employ a tuple or natural currying. I have tended in the past to default to tuples, because that is in essence the kind of semantics most programming languages I've learned emply when applying arguments to a function. I have realized, however, that there are almost no differences between currying arguments and tuples, except for the fact that currying lends itself to partial application, whereas tuples require all the arguments at once. I think in most cases partial application is much more useful unless enforcing a particular calling semantic with the given function. Both styles of parameter declarations support pattern matching, just with slightly different syntax. I guess typing all those `->` arrows just doesn't feel natural in the type definition. I'll stick with currying syntax for now.

My new `solve'` helper method looks really nice. I like the fact that I abstracted it as much as I could to make the solution more extensible, perhaps amenable to goats in a 3D space (Goat Simulator?).

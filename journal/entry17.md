# Entry 17

## April 24

# Weekly - Finishing a Past Lab

For this week I'm going to work on finishing entry 13's lab:

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

For the scalar product, I feel like I can use Monads and list comprehension to somehow generate the solution, however I'm just going to hardcode the 3D solution and work on completing the others. Since it's a dot product essentially, and I think list comprehensions automatically compute the dot product, I could use that feature. But alas, I'll move on.

Also... according to [wikipedia](https://en.wikipedia.org/wiki/Dot_product) the dot product is the same thing as the scalar product... I don't really understand the difference.

I don't really understand the [cross product](https://en.wikipedia.org/wiki/Cross_product) because it seems to only be applicable to 2D vectors, not the `Vec3` data type I've constructed... Perhaps that means I just need to take in two pairs of `Double`s (acting as 2D vectors) and then compute the `Vec3` based on them... maybe I will attempt to do that...

I'm a bit further, but I don't really understand the math on the wikipedia page, and I don't really want to figure that out, so I'll just leave the cross product undone for now. I find myself more and more concerned with the math and less concerned about how that math translates over into Haskell. I think if I understood the formulas well enough I could implement it fine, it's just that I don't have enough of a mathematical backround to do that.


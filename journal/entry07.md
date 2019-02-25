# Entry 07

## Feb 24

# Explorations

I'm still doing the `numsearch` problem from the lab, and it's quite tricky, although I think I was getting too bogged down in trying to nest maps. Nesting maps get so cumbersome sometimes, especially when there are some special operations at each level of the map.

I decided to create a cartesian product function in order to simplify nested mapping, which I want to avoid... I'd rather just create all the possible permutations myself and then use that tuple as the argument, rather than two function arguments and then partially apply nested maps, euk. That seems quite cumbersome.

I love Stackoverflow, so helpful: https://stackoverflow.com/questions/19625146/list-of-list-turn-90-degrees-in-haskell Apparently reversing a transpose achieves the 90 degree rotation needed to turn columns into rows! None of that gross recursion!

My thinking for solving the diagonals involves making each element in the list into a singleton, then padding the existing board with empty lists, shifting over rows with empty lists, then rotating the list, then concating the lists so that the empty lists disappear.

My first inclinations is that this rotation problem seems to require knowing the index of each row within the board in order to accurately shift it into a 45 degree rotation. I don't really want to keep track of indexes because it seems like it complicates the state of the functions, and I feel like there's a matrix multiplication trick or some function that I'm not seeing like the `reverse . transpose` trick, but I think I'm just going to go with the padding examples.

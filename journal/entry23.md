# Entry 23

## May 14

# Binary Search Trees

We reached our final topic in algorithms right before the final, and it's binary search trees! This looks very familiar from our `BinTree` examples which makes me happy, however maintaining a balanced binary search tree is difficult in any language (especially so in Haskell). Because we only had time to review search, I didn't get to the auto-balancing insertion algorithm for a binary search tree. The search was actually buggy enough... I had a few bugs relating to the order of the binary tree.

My misconception originated in thinking that the max element was at the root (like a heap I think) when in reality it should be one of the middlemost numbers in the set of numbers in the tree (not necessarily the mode, but close to it). Once I realized that the values of the left subtree all are less than the root value, and the right subtree greater than or equal to the root value, it started making a lot more sense to do an in-place traversal algorithm to search for the subtree with the given value.

See `bst` for my scratch work.
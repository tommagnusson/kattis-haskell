-- Binary Search Tree
-- use over hashtable when you need to keep sorted order

data BST a = Leaf | Branch { val :: a, left :: BST a, right :: BST a}
  deriving Show

-- logn, left < val <= right
search :: Ord a => BST a -> a -> BST a
search Leaf _ = Leaf
search b@(Branch x l r) y | x == y = b
                          | y >= x = search r y
                          | y <  x = search l y

-- logn
insert :: Ord a => BST a -> a -> BST a
insert Leaf y = Branch y Leaf Leaf
insert b@(Branch x l r) y = if x >= y

-- logn
remove :: Ord a => BST a -> a -> BST a
remove Leaf _ = Leaf
remove b@(Branch x l r) y = undefined




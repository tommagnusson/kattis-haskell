-- Really stupid implementations

data BinTree a = Leaf | Branch a (BinTree a) (BinTree a)
  deriving Show

instance Functor BinTree where
  fmap f Leaf = Leaf
  fmap f (Branch v r l) = Branch (f v) (fmap f r) (fmap f l)

instance Applicative BinTree where
  (<*>) Leaf b = Leaf
  (<*>) (Branch f _ _) b = fmap f b
  (*>) Leaf _ = Leaf
  (*>) (Branch _ _ _) bb = bb
  pure a = Branch a Leaf Leaf

instance Monad BinTree where
  return x                = Branch x Leaf Leaf
  (>>=)  (Branch v r l) f = f v
  (>>=)  Leaf           _ = Leaf
  (>>)   _ b              = b
  fail   s                = Leaf
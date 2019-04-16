data Stack a = EmptyStack | Push { peek :: a, pop :: Stack a }
  deriving Show
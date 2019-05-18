-- coin change, have {25, 10, 5, 1} coins available, minimize number of coins for change of n cents

data Coin = Quarter | Dime | Nickel | Penny
  deriving Show
  
val :: Coin -> Integer
val Quarter = 25
val Dime = 10
val Nickel = 5
val Penny = 1

change :: Integer -> [Coin]
change 0 = [];
change n | n >= 25 = Quarter : change (n - 25)
         | n >= 10 = Dime : change (n - 10)
         | n >= 5 = Nickel : change (n - 5)
         | n >= 1 = Penny : change (n - 1)
data Vec3 = Vec3 {getX :: Double, getY :: Double, getZ :: Double}
  deriving (Show, Eq)

magnitude :: Vec3 -> Double
magnitude (Vec3 x y z) = sqrt (x^2 + y^2 + z^2)

normalize :: Vec3 -> Vec3
normalize v@(Vec3 x y z) = undefined

instance Num Vec3 where
  (+) (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = Vec3 (x1 + x2, y1 + y2, z1 + z2)
  (-) (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = Vec3 (x1 - x2, y1 - y2, z1 - z2)
  (*) (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = Vec3 (x1 * x2, y1 * y2, z1 * z2)
  negate (Vec3 x1 y1 z1) = Vec3 (-x1, -y1, -z1)
  abs (Vec3 x1 y1 z1) = Vec3 (abs x1, abs y1, abs z1)  
  signum (Vec3 x1 y1 z1) = Vec3 (signum x1, signum y1, signum z1)
  fromInteger i = Vec3 (fromIntegral i, fromIntegral i, fromIntegral i)
  
  


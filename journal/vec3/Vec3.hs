data Vec3 = Vec3 {getX :: Double, getY :: Double, getZ :: Double}
  deriving (Show, Eq)

magnitude :: Vec3 -> Double
magnitude (Vec3 x y z) = sqrt (x^2 + y^2 + z^2)

normalize :: Vec3 -> Vec3
normalize v@(Vec3 x y z) = Vec3 (x / m) (y / m) (z / m)
  where m = magnitude v


-- I know the scalar product can be found somehow using lists of triples as Monad...
scalarProduct :: Vec3 -> Vec3 -> Double
scalarProduct v@(Vec3 x y z) w@(Vec3 a b c) = 
  x * a + x * b + x * c + y * a + y * b + y * c + z * a + z * b + z * c 

dotProduct :: Vec3 -> Vec3 -> Double
dotProduct = scalarProduct

-- little bit of an asymmetric implementation between
-- the Vec2 type alias and the new data type of Vec3
-- But oh well
type Vec2 = (Double, Double)

mag :: Vec2 -> Double
mag v@(Vec2 x y) = sqrt (x^2 + y^2)

dotProd :: Vec2 -> Vec2 -> Double
dotProd (x, y) (a, b) = x * a + y * b

ang :: Vec2 -> Vec2 -> Double
ang v@(x, y) w@(a, b) = dotProd v w / (mag v * mag w)

-- TODO
crossProduct :: Vec2 -> Vec2 -> Vec3
crossProduct v@(x, y) w@(a, b) = mag v * mag w * (sin $ ang v w) * n

instance Num Vec3 where
  (+) (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = Vec3 (x1 + x2, y1 + y2, z1 + z2)
  (-) (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = Vec3 (x1 - x2, y1 - y2, z1 - z2)
  (*) (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = Vec3 (x1 * x2, y1 * y2, z1 * z2)
  negate (Vec3 x1 y1 z1) = Vec3 (-x1, -y1, -z1)
  abs (Vec3 x1 y1 z1) = Vec3 (abs x1, abs y1, abs z1)  
  signum (Vec3 x1 y1 z1) = Vec3 (signum x1, signum y1, signum z1)
  fromInteger i = Vec3 (fromIntegral i, fromIntegral i, fromIntegral i)
  
  


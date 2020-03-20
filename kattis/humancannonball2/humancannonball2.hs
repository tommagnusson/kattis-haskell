parse :: String -> [[Double]]
parse = map (map read . words) . tail . lines

solve :: [[Double]] -> [Bool]
solve = map solve'

solve' :: [Double] -> Bool
solve' [v0, theta, x1, h1, h2] = y - 1 > h1 && y + 1 < h2
    where
        t = tFromX v0 theta x1
        y = yFromT v0 t theta


tFromX :: Double -> Double -> Double -> Double
tFromX v0 theta x1 = x1 / (v0 * (cos $ degreesToRadians theta))

yFromT :: Double -> Double -> Double -> Double
yFromT v0 t theta = v0 * t * (sin $ degreesToRadians theta) - (0.5 * g * t**2)

degreesToRadians :: Double -> Double
degreesToRadians = (*) (pi / 180.0)

display :: [Bool] -> String
display = unlines . map display'

display' :: Bool -> String
display' True = "Safe"
display' False = "Not Safe"

main :: IO ()
main = interact (display . solve . parse)

g :: Double
g = 9.81

-- 20 v0 = velocity in m/s
-- 45 theta = angle
-- 20 x1 = distance from cannon to the wall
-- 9  h1 = lower height of wall
-- 12 h2 = upper height of wall

-- need to solve x(t) = v0 * t * cos(theta)
-- which is t = x(t) / (v0 * cos(theta))

-- then we need to solve y(t) = v0 * t * sin(theta) - (0.5) * g * t**2

-- then we need to know whether that value is above the lower lip and below the upper lip

-- ex. "11\n19 45 20 9 12\n20 45 20 9 12\n25 45 20 9 12\n20 43 20 9 12\n20 47.5 20 9 12\n20 45 17 9 12\n20 45 24 9 12\n20 45 20 10 12\n20 45 20 9 11\n20 45 20 9.0 11.5\n20 45 18.1 9 12"

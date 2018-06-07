
data Point = Point Float Float deriving (Show)

data Shape = Circle Point Float | Rectangle Point Point deriving (Show)


distZero :: Point -> Float
distZero(Point x y) = y+x
--usage example
--distZero(Point 10 10)

dist1 :: Point -> Point -> Point
dist1 p1 p2 = p1
--usage example
--dist ( Point 10 10) (Point 20 20)


dist2 :: Point -> Point -> Float
dist2 (Point x1 y1)  (Point x2 y2) = abs(y2 - y1) + abs(x2 - x1)


surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)
--usage example
--surface(Rectangle(Point 0 0) (Point 10 10))
--surface(Cicrle(Point 10 10) 5)


shift :: Shape -> Float -> Float -> Shape
shift (Circle (Point x y) r) xdelta ydelta = Circle(Point(x+xdelta) (y+ydelta)) r
shift (Rectangle (Point x1 y1) (Point x2 y2)) xdelta ydelta = Rectangle (Point(x1+xdelta) (y1+ydelta)) (Point(x2+xdelta) (y2+ydelta))




data Person = Person{fname :: String, lname :: String, age :: Int} deriving(Show)


data Vector = Vector Float Float deriving(Show)

vplus :: Vector -> Vector -> Vector
vplus (Vector x1 y1) (Vector x2 y2) = Vector (x1+x2) (y1+y2)
-- usage example
-- vplus ( Vector 1 1) (Vector 2 2)




data Vector a = Vector a a deriving(Show)

xUnitVect :: (Num t) => Vector t
xUnitVect = Vector 1 0


scalMult :: (Num t) => Vector t -> t -> Vector t
scalMult (Vector x y) a = Vector (a*x) (a*y)
--example
--scalMult (Vector 2 3) 5




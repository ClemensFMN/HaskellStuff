

-- define a type with no parameters
data MyBool = ValA | ValB

-- and implement the Show Typeclass for MyBool
instance Show MyBool where
  show ValA = "ValA"
  show ValB = "ValB"


f1 :: MyBool -> MyBool
f1 ValA = ValB
f1 ValB = ValA

f2 :: MyBool -> Int
f2 ValA = 1
f2 ValB = 0

-- another type (that's actually Maybe) taking a parameter
data MyType a = Nix | Val a -- deriving (Show)

-- that's actually a bit tricky
-- we want that in case of Val a the value of a gets printed...
-- to this end, a must implement typeclass show (otherwise the printing does not work)
instance (Show a) => Show (MyType a) where
  show Nix = "Nothing"
  show (Val a) = show a -- in case of a Val a, we simply make a show, requiring a to implement typeclass show...

g1 :: Int -> MyType Int
g1 x
 | x < 0 = Nix
 | otherwise = Val x

g2 :: (MyType Int) -> Int
g2 Nix = 0
g2 (Val x) = x

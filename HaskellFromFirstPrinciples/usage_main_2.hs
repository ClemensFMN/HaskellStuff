module Main where

-- a new datatype
data  Vielleicht a = Nix | Wert a deriving Show

-- we implement the (existing) Eq typeclass for the new datatype
-- in case of a Wert x - Wert y comparison, we compare x and y -> therefore,
-- x and y must implement Eq themselves
-- (otherwise, the comparison is not possible)
instance (Eq a) => Eq (Vielleicht a) where
  Nix == Nix = True
  Wert x == Wert y = (x == y)
  _ == _ = False

-- a function
f1 :: (Num a) => Vielleicht a -> Vielleicht a -> Vielleicht a
f1 Nix Nix = Nix
f1 (Wert x) (Wert y) = Wert (x * y)
f1 _ _ = Nix

-- and another function main
main :: IO ()
main = do
  putStrLn "Hello World"
  print (f1 (Wert 2) (Wert 5))
  print (f1 (Wert 2) Nix)


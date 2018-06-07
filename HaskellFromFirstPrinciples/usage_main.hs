module Main where
-- this is a module with declarations as below
-- it can be used in the following ways:
-- 1) load into ghci and execute functions (e.g. f1 3, or main)
-- 2) load into ghci and execute main
-- 3) compile into an executable (ghc filename) and execute the binary

f1 :: Int -> Int
f1 x = x+1

-- a new datatype
data Vielleicht a = Nix | Wert a deriving (Eq, Show)

-- a function
f2 :: (Num a) => Vielleicht a -> a
f2 Nix = 0
f2 (Wert x) = x

-- and another function main
main :: IO ()
main = do
  putStrLn "Hello World"
  print (f1 3)

  print (f2 Nix)
  print (f2 (Wert 5))

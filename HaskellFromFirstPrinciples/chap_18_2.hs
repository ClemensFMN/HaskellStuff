module Main where


f1 :: Int -> Maybe Int
f1 x
  | x == 0 = Nothing
  | otherwise = Just (x+1)


f2 :: Int -> Maybe Int
f2 x
  | x == 1 = Nothing
  | otherwise = Just (2*x)


fcase :: Int -> Maybe Int
fcase x =
  case f1 x of
    Nothing -> Nothing
    Just r1 -> Just r1

-- this is the ugly way of composing the functions
-- after every function we check for Nothing / Just and depending on the result
-- we continue accordingly
comb_f1_f2 :: Int -> Maybe Int
comb_f1_f2 x =
  case f1 x of
    Nothing -> Nothing -- when the first function returns nothing, we can return nothing right away
    Just y -> -- only if we get a Just, we continue with the second function application
      case f2 y of
        Nothing -> Nothing
        Just z -> Just z

-- a bit simplified
comb_f1_f2_v2 :: Int -> Maybe Int
comb_f1_f2_v2 x =
  case f1 x of
    Nothing -> Nothing -- when the first function returns nothing, we can return nothing right away
    Just y -> (f2 y)-- only if we get a Just, we continue with the second function application

-- the same, but way easier by using monadic bind
monadic_comp_v1 :: Int -> Maybe Int
monadic_comp_v1 x = f1 x >>= f2

-- the same function, only different syntax...
monadic_comp_v2 :: Int -> Maybe Int
monadic_comp_v2 x = do
  res1 <- f1 x
  f2 res1



main :: IO ()
main = do
  print (comb_f1_f2 0)
  print (comb_f1_f2 1)

  print (comb_f1_f2_v2 0)
  print (comb_f1_f2_v2 1)

  print (monadic_comp_v1 0)
  print (monadic_comp_v1 1)

  print (monadic_comp_v2 0)
  print (monadic_comp_v2 1)


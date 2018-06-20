f1 x = x+1

f2 x = 2*x

mysum a b f =
  if a > b
    then 0
    else (f a) + mysum (a+1) b f

myfrac n =
  if n==0
    then 1
    else n * myfrac (n-1)

myfilter :: (a -> Bool) -> [a] -> [a]
myfilter _ [] = []
myfilter f (x:xs)
             | f x == True = x : myfilter f xs
             | otherwise = myfilter f xs


-- myfilter even [1..5]
-- myfilter (not . even) [1..5]


-- it is somehow not possible to define this as a recursive function
-- mypartition f [] = [] -- this has return type []
-- mypartition f (x:xs) -- but the stuff below has return type ([a],[a]) -> this does not match...
--                   | f x == True = (x : mypartition f xs, mypartition f xs)
--                   | otherwise   = (mypartition f xs, x : mypartition f xs)

mypartition :: (a -> Bool) -> [a] -> ([a],[a])
mypartition f xs = (myfilter f xs, myfilter (not . f) xs)

--mypartition even [1..10]



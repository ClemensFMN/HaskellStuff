


factorial :: Int -> Int
factorial 0 = 1
factorial n = n*factorial (n-1)


fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)


fiblist :: Int -> [Int]
fiblist 0 = []
fiblist 1 = [1,0]
fiblist n = [sum $ take 2 (fiblist (n-1))] ++ fiblist (n-1)

myAll :: (a -> Bool) -> [a] -> Bool
myAll _ [] = True
myAll f (x:xs)
  | (f x) == True = myAll f xs -- if the current element evaluates to true, continue
  | otherwise = False -- otherwise short-circuit to false

-- myAll even [2,4,10] -> True
-- myAll even [1,3,5] -> False

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False -- we have never seen a true so far -> return false
myAny f (x:xs)
  | (f x) == True = True -- one true -> short-circuit to true
  | otherwise = myAny f xs -- otherwise continue wit the rest...

-- based on https://mail.haskell.org/pipermail/haskell-cafe/2002-June/003122.html
selections :: [a] -> [(a,[a])]
selections [] = []
selections (x:xs) = (x,xs) : [ (y,x:ys) | (y,ys) <- selections xs ]


permutations :: [a] -> [[a]]
permutations [] = [[]]
permutations xs =
    [ y : zs | (y,ys) <- selections xs, zs <- permutations ys]

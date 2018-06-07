
-- stupid
fib_N :: Int -> Int
fib_N 0 = 1
fib_N 1 = 1
fib_N n = fib_N (n-1) + fib_N (n-2)


-- clever (list comprehension using laziness)
-- not by me, but http://stackoverflow.com/questions/2404156/understanding-haskells-fibonacci
fibs :: [Int]
fibs = 0 : 1 : [ a + b | (a, b) <- zip fibs (tail fibs)]

-- check out
-- a =  [1,2,3]
-- zip a (tail a)


-- takes a number and checks whether it is a fibonacci
-- does not stop when n not a fibonacci -> not good :-(
check_fib_1 :: Int -> Bool
check_fib_1 n = elem n fibs

-- is this better - we restrict the list and then check whether n is contained in the list...
check_fib_2 :: Int -> Bool
check_fib_2 n = elem n (takeWhile (<= n) fibs)


-- http://stackoverflow.com/questions/10735778/haskell-checking-if-number-is-from-fibonacci-sequence
check_fib_3 :: Int -> [Int] -> Bool
check_fib_3 n (x:xs)
  | n == x = True
  | n > x  = check_fib_3 n xs
  | otherwise  = False

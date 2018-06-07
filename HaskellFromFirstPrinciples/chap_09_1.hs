lst = [1,2,4,5,6]


myLength :: [a] -> Int
myLength [] = 0
myLength (_ : xs) = 1 + myLength(xs)


mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum(xs)


myTake :: Int -> [a] -> [a]
myTake n _
  | n <= 0 = []
myTake n [] = []
myTake n (x:xs) = x : (myTake (n-1) xs)

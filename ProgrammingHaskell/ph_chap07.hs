-- map (\x -> x+1) [1,2,3,4]


mymap :: (a->b) -> [a] -> [b]
mymap f [] = []
mymap f (x:xs) = (f x) : mymap f xs

-- mymap (\x -> x+1) [1,2,3,4]

mymap2 ::(a->b) -> [a] -> [b]
mymap2 f xs = [f x | x <- xs]

-- mymap2 (\x -> x+1) [1,2,3,4]


myfilter :: (a->Bool) -> [a] -> [a]
myfilter f [] = []
myfilter f (x:xs) | (f x == True) = x : (myfilter f xs)
                  | otherwise = myfilter f xs

-- myfilter (\x -> x>2) [1..10]

myfilter2 :: (a->Bool) -> [a] -> [a]
myfilter2 f xs = [x | x <- xs, f x == True]

-- myfilter2 (\x -> x>2) [1..10]


myAll :: (a->Bool) -> [a] -> Bool
myAll f [] = True
myAll f (x:xs) | f x == True = myAll f xs
               | otherwise = False

-- myAll even [1,2,3]
-- myAll even [2,4,6]


funcComp :: [Int] -> Int
funcComp = sum . map (*2) . filter even
-- funcComp [0..10]
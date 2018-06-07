-- problem 1: last element of list
myLast :: [a] -> a
myLast [] = error "empty list!"
myLast [x] = x
myLast (x:xs) = myLast xs

-- myLast [1..10]
-- myLast [1]
-- myLast []

myLast2 [] = error "No end for empty lists!"  
myLast2 x = x !! (length x -1)

-- problem 2: last but one element of a list
myButLast :: [a] -> a
myButLast [] = error "empty list!"
myButLast [a] = error "one element list!"
myButLast [a,b] = a
myButLast (x:xs) = myButLast xs

-- myButLast [1..10]
-- myButLast [1]
-- myButLast []

-- import qualified Data.List

-- problem 8: Eliminate consecutive duplicates of list elements
compress :: Eq a => [a] -> [a]
compress xs = map head eqLsts -- and take the head from every sublist -> the map is needed so that we take the head of EVERY sublist!
                 where eqLsts = Data.List.group xs -- group the list into sublists of equal elements

-- compress [1,1,2,3,4,4,1]


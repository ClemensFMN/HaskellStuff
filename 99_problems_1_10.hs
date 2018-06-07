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


-- problem 3: Find the K'th element of a list. 

-- fails if index > length of list
elementAt :: [a] -> Int -> a
elementAt (x:xs) pos
    | pos == 0 = x
    | otherwise = elementAt xs (pos-1)

elementAt' :: [a] -> Int -> a
elementAt' (x:_) 1  = x
elementAt' [] _     = error "Index out of bounds"
elementAt' (_:xs) k
  | k < 1           = error "Index out of bounds"
  | otherwise       = elementAt' xs (k - 1)


-- problem 4: # of list elements
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs


-- problem 6: check for palindrome
checkPalindrome :: Eq a => [a] -> Bool
checkPalindrome xs = xs == reverse xs

-- checkPalindrome [1,2,3]
-- checkPalindrome [1,2,3,2,1]
-- checkPalindrome "Hello"
-- checkPalindrome "apa"


-- import qualified Data.List

-- problem 8: Eliminate consecutive duplicates of list elements
compress :: Eq a => [a] -> [a]
compress xs = map head eqLsts -- and take the head from every sublist -> the map is needed so that we take the head of EVERY sublist!
                 where eqLsts = Data.List.group xs -- group the list into sublists of equal elements

-- compress [1,1,2,3,4,4,1]


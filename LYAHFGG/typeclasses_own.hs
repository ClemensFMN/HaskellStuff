-- define a typeclass called BasicEq
class BasicEq a where
	-- which contains a function called isEqual
    isEqual :: a -> a -> Bool

-- define the behaviour of the typeclass BasicEq for Bool types
instance BasicEq Bool where
    isEqual True  True  = True
    isEqual False False = True
    isEqual _     _     = False

-- define the behaviour of the typeclass BasicEq for Int types
instance BasicEq Int where
    isEqual a b  
        | a < b  = True
        | otherwise = False

-- use function like this (use read to enforce Int type) 
-- isEqual (read "3"::Int) (read "5"::Int)




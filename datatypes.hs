
data MyOption a = MyNothing | MyJust a deriving Show

safeHead :: [a] -> MyOption a
safeHead [] = MyNothing
safeHead (xs:_) = MyJust xs

-- safeHead []
-- safeHead [1]
-- safeHead [1,2,3]
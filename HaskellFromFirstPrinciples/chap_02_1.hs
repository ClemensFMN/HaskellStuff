-- function with one argument
doubleMe :: Num a => a -> a
doubleMe x = 2 * x

-- function with two arguments
-- actually, this is a nested function (twoArgs x) y because of currying...
twoArgs :: Num a => a -> a -> a
twoArgs x y = 2*x + y

add8 = twoArgs 4
-- and add8 1 yields 9...

-- we can also define an anonymuous function...
f1 = (\x -> 4*x)

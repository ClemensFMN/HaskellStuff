
mysum :: (Num a) => [a] -> a
mysum [] = 0
mysum (x:xs) = x + mysum xs

-- mysum [1..5]

funnyfun :: (Num a) => [a] -> (a, a, [a])
-- the @ operator allows giving name to the whole argument
funnyfun all@(x:xs) = (sum xs, x, all)

-- funnyfun [1..5]

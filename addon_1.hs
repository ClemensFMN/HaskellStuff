-- sliding

sliding :: Int -> Int -> [a] -> [[a]]
sliding size offset [] = []
sliding size offset xs = [take size xs] ++ sliding size offset (drop offset xs)


-- sliding 5 2 [1..10]
-- sliding 4 1 [1..10]


zipWithSelf :: [a] -> [(a,a)]
zipWithSelf [] = []
zipWithSelf (x:xs) = (x,x) : zipWithSelf xs

--zipWithSelf []
--zipWithSelf [1,2,3]


zipWithPred  :: (a->Bool) -> [a] -> ([a], [a])
zipWithPred f xs = (filter f xs, filter (not . f) xs)



--import qualified Data.Map as Map


mp1 = Map.fromList [("a", 1), ("b", 4)]

-- Map.lookup "a" mp1


-- Map.insert "c" 10 mp1
-- Map.insert "a" 2 mp1

unpackDefault :: Maybe Int -> Int -> Int
unpackDefault Nothing d = d
unpackDefault (Just x) d = x

-- increment a Maybe Int
incDefault :: Maybe Int -> Int
incDefault Nothing = 1 -- in case of Nothing, set to one
incDefault (Just x) = x+1 -- in case of a value, increment it


-- update a map with a key: If the key is not there, add key with value 0; otherwise increment the value by one
updateMap k mp = Map.insert k newVal mp
                   where newVal = incDefault (Map.lookup k mp)

-- updateMap "a" mp1
-- updateMap "c" mp1


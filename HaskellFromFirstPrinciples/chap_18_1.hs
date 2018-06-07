type Bird = Int
type Pole = (Int, Int)

landLeft :: Int -> Pole -> Maybe Pole
landLeft n (left,right)
  | abs((left+n)-right) < 4 = Just (left+n, right)
  | otherwise = Nothing

-- landLeft 3 (0,0) yields Just (3,0)
-- landLeft 3 (3,3) yields Just (6,3)
-- landLeft 4 (0,0) yields Nothing
-- landLeft 3 (3,0) yields Nothing



landRight :: Int -> Pole -> Maybe Pole
landRight n (left,right)
  | abs((right+n)-left) < 4 = Just (left, right+n)
  | otherwise = Nothing


-- landRight 3 (0,0) yields Just (0,3)
-- landRight 3 (3,3) yields Just (3,6)
-- landRight 4 (0,0) yields Nothing
-- landRight 3 (0,3) yields Nothing

-- we can do a monadic bind; e.g.
-- return (0,0) >== landLeft 2 >== landRight 4 yields Just (2,4)
-- return (0,0) >== landLeft 5 >== landRight 4 yields Nothing

-- define a function which introduces "non-determinism"; i.e. one input causes more than one output
f1 :: Int -> [Int]
f1 x = [-x, x]

-- [1,2,3] >>= f1

type KnightPos = (Int,Int)


moveKnight :: KnightPos -> [KnightPos]
moveKnight (c,r) = filter onBoard
    [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)
    ,(c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)
    ]
    where onBoard (c,r) = c `elem` [1..8] && r `elem` [1..8]


-- moveKnight (6,2)

in3 start = return start >>= moveKnight >>= moveKnight >>= moveKnight  

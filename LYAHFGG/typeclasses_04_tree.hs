

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)


singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree



treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (treeInsert x left) right
    | x > a  = Node a left (treeInsert x right)


buildTree :: (Ord a) => [a] -> Tree a
buildTree lst = foldr treeInsert EmptyTree lst

--let nums = [8,6,4,1,7,3,5]
--let numsTree = foldr treeInsert EmptyTree nums

--numsTree  
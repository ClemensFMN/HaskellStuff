data Tree a
  = Empty
  | Node { value :: a
         , left :: Tree a
         , right :: Tree a}
 
preorder :: Tree a -> [a]
preorder Empty = []
preorder (Node v l r) = v : preorder l ++ preorder r


tree :: Tree Int
tree =
  Node
    1
    (Node 2 (Node 4 (Node 7 Empty Empty) Empty) (Node 5 Empty Empty))
    (Node 3 (Node 6 (Node 8 Empty Empty) (Node 9 Empty Empty)) Empty)


-- preorder tree

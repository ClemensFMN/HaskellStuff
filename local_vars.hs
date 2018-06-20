func1 :: Int -> Int
func1 x = let y = x+1 -- introduce local vars with let - define y
              z = x*x -- and z
          in x+y*z -- in ends the local var definition and uses the local vars + params

--func1 3


func2 :: Int -> Int
func2 x = let y = x+1 -- introduce local vars with let - define y
              z = y*y -- and z which can reuse previously defined local vars
          in z+1 -- in ends the local var definition and uses the local vars + params

--func2 3



lend :: Int -> Int -> Maybe Int
lend amount balance = let reserve = 100
                          newBal = balance - amount
                      in 
                          if newBal < reserve
                            then Nothing
                            else Just newBal

-- lend 10 1000
-- lend 100 150

-- we 

lend2 :: Int -> Int -> Maybe Int
lend2 amount balance = if newBal < reserve
                         then Nothing
                         else Just newBal
              where reserve = 100
                    newBal = balance - amount

-- lend2 10 1000
-- lend2 100 150


f1 x = x+1

f2 x = 2*x

mysum a b f =
  if a > b
    then 0
    else (f a) + mysum (a+1) b f

myfrac n =
  if n==0
    then 1
    else n * myfrac (n-1)



-- taken from http://philipnilsson.github.io/Badness10k/posts/2013-10-11-functional-waterflow.html
-- and here http://chrisdone.com/posts/twitter-problem-loeb

module Main where

-- at the i-th position we look to the left and take the maximum of the stuff left from our current position
high_left :: [Int] -> [Int]
high_left h= scanl1 max h

-- same as above but looking to the right
high_right :: [Int] -> [Int]
high_right h= scanr1 max h


-- the water
fill_level :: [Int] -> [Int]
fill_level h = zipWith min (high_left h) (high_right h)

water_level :: [Int] -> [Int]
water_level h = zipWith (-) (fill_level h) h

main :: IO ()
main = do
  let h = [5, 1, 1, 6, 2, 2, 7]-- [2,5,1,2,3,4,7,7,6]
  print h
  print (high_left h)
  print (high_right h)
  print (fill_level h)
  print (water_level h)
  -- get volume by summing over the water level
  print(sum (water_level h))
 

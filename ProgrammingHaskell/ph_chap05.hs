
-- return indices where the list element eqals val
findi :: Eq a  => a -> [a] -> [Int]
findi val xs = [i | (x,i) <- zip xs [0..], x == val]

--findi 2 [1,2,4,6,7,2,2,10]

-- return indices and val, where p list element == true
findivp :: (a -> Bool) -> [a] -> [(Int, a)]
findivp p xs = [(i,x) | (x,i) <- zip xs [0..], p x == True]

-- findivp (\x -> x==2) [1,2,4,6,7,2,2,10]

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

-- factors 15
-- factors 12452

isPrime :: Int -> Bool
isPrime n = factors(n) == [1,n]

-- isPrime 15
-- isPrime 13

primes :: Int -> [Int]
primes n = [x | x <- [2..n], isPrime x]

-- primes 40

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXY--

-- Caesar Cipher
--import Data.Char

let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n) `mod` 26)
          | otherwise = c

-- shift 3 'a'

encode :: Int -> String -> String
encode n s = [shift n x | x <-s]

-- encode 3 "hello world"

positions :: Eq a => a -> [a] -> [Int]
positions val xs = [i | (x,i) <- zip xs [0..], x==val]

count :: Char -> String -> Int
count c s = length [x | x <- s, x==c]

lowers :: String -> Int
lowers s = length [x | x <- s, isLower x]

-- count 'a' "hello world"  

percent :: Int -> Int -> Float
percent a b = (fromIntegral a) / (fromIntegral b) * 100

freqs :: String -> [Float]
freqs s = [percent (count x s) (lowers s) | x <- ['a'..'z']]

-- freqs "hello world"

chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o-e)^2)/e | (o,e) <- zip os es]

rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs

table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

crack :: String -> String
crack s = encode (-factor) s
  where
    factor = head (positions (minimum chitab) chitab)
    chitab = [chisqr (rotate n table') table | n <- [0..25]]
    table' = freqs s

-- crack (encode 3 "haskell is fun")
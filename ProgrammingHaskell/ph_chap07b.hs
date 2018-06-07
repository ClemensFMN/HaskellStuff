-- everything is LSB FIRST

bin2int :: [Int] -> Int
bin2int bits = sum [w*b | (w,b) <- zip weights bits]
                    where weights = iterate (*2) 1

-- bin2int [1,0,1,1]
-- 1 + 4 + 8 = 13

int2bin :: Int -> [Int]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

-- int2bin 13

make8 :: [Int] -> [Int]
make8 bits = take 8 (bits ++ repeat 0)

-- make8 (int2bin 13)


--import Data.Char

encode :: String -> [Int]
encode = concat . map (make8 . int2bin .ord)

-- encode "AC"

chop8 :: [Int] -> [[Int]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

-- chop8 [1..16]


decode :: [Int] -> String
decode = map (chr . bin2int) . chop8

-- decode (encode "Hello")






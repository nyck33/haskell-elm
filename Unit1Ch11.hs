module Types where

--avg
--myAvg aList = sum aList / length aList
--myAvg :: [Int] -> Int -> Double
--myAvg aList = (fromIntegral total) / lenAList
  --  where total = foldl (+) 0 aList
    --      lenAList = length aList

--half
half :: Int -> Double 
half n = (fromIntegral n) / 2

--quickCheck 1.1
halve :: Int -> Int 
halve n = n `div` 2

--convert values to string
str6 = show 6
strC = show 'c'
strSix = show 6.0

--quickCheck 11.2
printDouble :: Int -> String 
printDouble n = show (n * 2)

--listing 11.6 read string and convert to other type
z = read "6" :: Int 
y = read "7" :: Double
x = read "8" :: Integer
q = y/2

anotherNum :: Int 
anotherNum = read "6"

--for funcs
makeAddress :: Int -> String -> String -> (Int, String, String)
makeAddress number street town = (number, street, town)
--nested lambdas
--partial application
{-
(((makeAddress 123) "Happy St") "Haskell Town") (Int, String, String)
-}
makeAddressL :: Int -> String -> String -> (Int, String, String)
makeAddressL = (\number ->
                    \street ->
                        \town -> (number, street, town))

--11.7
--(f accepts Int returns Int)
ifEven :: (Int -> Int) -> Int -> Int 
ifEven f n = if even n
             then f n
             else n 

--lower case letter means any type can be used
--type variable
--11.9 
simple :: a -> a
simple x = x

--any types for a,b,c
--a,b,c can be same or different types
makeTriple :: a -> b -> c -> (a,b,c)
makeTriple x y z = (x, y, z)

--map type signature
--map f list
--(f accepts some type and returns some type)
--so f accepts type a, returns type b
-- real power of map isn't iteration but transforming 
-- list to list of another type
mapType :: (a -> b) -> [a] -> [b]
mapType f aList = map f aList
--for myMap show [1..4]
myMap :: (a -> b) -> [a] -> [b]
myMap show aList = map show aList

--Q 11.1 type signature for filter
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f [] = []
myFilter f (x:xs) = 
    if f x then x: myFilter f xs
    else myFilter f xs

--Q 11.2 head and tail that returns [] for []
--myHead :: [a] -> a ie. can't write type signature since
--head does not return list
--myHead [] = []
--myHead (x:xs) = x
myTail :: [a] -> [a]
myTail [] = []
myTail aList = tail aList

--Q 11.3 type signture of myFoldl
--myFoldl :: (a -> b) -> a -> a 
--how could it be (t -> a -> t)?
--should be (a -> a -> a)
myFoldl f init [] = init
myFoldl f init (x:xs) = myFoldl f newInit xs
    where newInit = f init x

cool = myFoldl (\x y ->  x + y) 0 [1..4] 
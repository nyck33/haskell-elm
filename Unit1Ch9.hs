module HighOrderFunctions where

import Data.Char

--any func that takes another func as argument

--abstracting similar funcs such as below
add3ToAll [] = []
add3ToAll (x:xs) = (3 + x) : add3ToAll xs
mul3ByAll [] = []
mul3ByAll (x:xs) = (3 * x) : mul3ByAll xs

--map
vehicles = map ("a " ++) ["train", "plane", "boat"]
squares = map (^2) [1,2,3]

--recreate map
addAnA [] = []
addAnA (x:xs) = ("a " ++ x) : addAnA xs

squareAll [] = []
squareAll (x:xs) = x^2 : squareAll xs

myMap f [] = []
myMap f (x:xs) = (f x) : myMap f xs

--filter list
evenOnly = filter even [1..10]

aFruits = filter (\(x:xs) -> x == 'a') ["apple", "banana", "avocado"]

myFilter testFunc [] = []
myFilter testFunc (x:xs) = 
    if testFunc x
        then x : myFilter testFunc xs
    else myFilter testFunc xs

--remove if pass test
myRemove testFunc [] = []
myRemove testFunc (x:xs) = 
    if testFunc x
        then myRemove testFunc xs
    else
        x : myRemove testFunc xs

--foldl takes list and reduces to single value
sumList = foldl (+) 0 [1..10]
concatAll xs = foldl (++) "" xs
myProduct xs = foldl (*) xs

sumOfSquares xs = foldl (+) 0 (map (^2) xs)

--reverse list with helper func rcons
rcons x y = y:x
reverseRcons [] = []
reverseRcons xs = foldl rcons [] xs

--foldl
myFoldl f init [] = init 
myFoldl f init (x:xs) = myFoldl f res xs
    where res = f init x

--foldr, recurses to base case of empty list
myFoldr f init [] = init
myFoldr f init (x:xs) = f x rightRes
    where rightRes = myFoldr f init xs 

--Q9.1
myElem target [] = False 
myElem target (x:xs) = 
    if target == x then True 
    else myElem target xs

myElem2 target xs = length (filter ( == target) xs) > 0
--myElem2 target (x:xs) = filter (\x -> target == x) xs

--Q9.2
--delete spaces with helper func
removeSpaces [] = []
removeSpaces (x:xs) = 
    if x == ' ' then removeSpaces xs
    else x: removeSpaces xs

isPalindrome phrase = phrase == reverse (removeSpaces phrase)

--using map and filter
isPalindrome2 phrase = 
    reverse phrase' == phrase' 
    where phrase' = map toLower (filter (/= ' ') phrase)

--Q9.3
harmonic 0 = 0
harmonic n =
    (1/n) + harmonic (n - 1)

harmonic2 n = foldl (+) 0 (take n fractArr)
    where fractArr = map (\pair -> fst pair / snd pair) tupsArr
          tupsArr = zip (repeat 1.0) [1.0, 2.0 ..]

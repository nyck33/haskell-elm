module Recursion where

--make my own take


myTake _ [] = []
myTake 0 _ = [] 
myTake n (x : xs) = x : myTake (n - 1) xs

take' _ []       = []
take' 0 _        = []
take' n (x : xs) = x : take' (n - 1) xs
--listing 7.1 GCD
myGCD a b = if remainder == 0
            then b
            else myGCD b remainder
    where remainder = a `mod` b


--Pattern Matching
--7.2
sayAmount n = case n of
    1 -> "one"
    2 -> "two"
    _ -> "a bunch"

--pattern matching
sayAmount' 1 = "one"
sayAmount' 2 = "two"
sayAmount' _ = "a bunch"

--basic
isEmpty [] = True 
isEmpty _ = False 

--myHead, says a list is actually a head and tail
--matches a pattern for list if empty error
myHead (x:xs) = x
myHead [] = error "no head for empty list"

--quick check 7.3
myTail (_:xs) = xs
myTail [] = error "no tail for empty list"

--Q7.1
myTail2 (_:xs) = xs
myTail2 [] = []

--Q7.3
myGCD' a 0 = a
myGCD' a b = myGCD' b (a `mod` b) 


module RecursiveFunctions where

--define the base case
myDrop 0 xs = xs
myDrop _ [] = []
myDrop n (x:xs) = myDrop (n-1) xs

--myLength
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

--another version of myTake
myTake 0 _ = []
myTake _ [] = []
myTake n (x:xs) = x:rest
    where rest = myTake (n-1) xs

--myCycle infinitely repeat list
myCycle [] = error "empty list can't cycle"
myCycle (x:xs) = 
    (x:xs) ++ [x]

--ackermann 
--runtime explodes
ackermann 0 n = n + 1
ackermann m 0 = ackermann (m-1) 1
ackermann m n = ackermann (m-1) (ackermann m (n-1))

--collatz conjecture
collatz 1 = 1
collatz n = if even n 
    then 1 + collatz (n `div` 2)
    else 1 + collatz (n*3 + 1)

mapCollatz = map collatz [100..120]

--implement reverse, Q8.1
myReverse [] = []
--myReverse _ = "error need list param"
myReverse xs = xs !! (length xs - 1) : myReverse (init xs)

--Q8.2
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib(n-2)
--fastFib
--fastFib 1 1 5, fastFib 1 1 1000
--0 1 2 3 4 5 6 7  8  9  10
--0 1 1 2 3 5 8 13 21 34 55
fastFib _ _ 1 = 0
fastFib _ _ 2 = 1
--fastFib 1 1 3 = 1 
fastFib n1 n2 counter = 
    if counter == 3 then n1 + n2
    else fastFib n2 (n2 + n1) (counter - 1)
      


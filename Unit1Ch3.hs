module Unit1Ch3 where

sumSquareOrSquareSum x y = 
    if sumSquare > squareSum
        then sumSquare
    else squareSum
    where sumSquare = x^2 + y^2
          squareSum = (x+y)^2

body sumSquare squareSum = 
    if sumSquare > squareSum
        then sumSquare
    else squareSum

sumSquareOrSquareSum2 x y = 
    body (x^2 + y^2) ((x+y)^2)

body2 = (\sumSquare squareSum ->
            if sumSquare > squareSum 
                then sumSquare
                else squareSum)

sumSquareOrSquareSum3 x y = 
    body2 (x^2 + y^2) ((x+y)^2)

--Quickcheck 3.2 
--Q1
dubs2 = (\x -> x * 2)

doubleDouble x = dubs*2
    where dubs = x*2

doubleDouble2 x = dubs2 (dubs2 x)
--lambda version
doubleDoubleLam = \x -> (\dubs -> dubs * 2) x * 2

--using let
sumSquareOrSquareSumLet x y = 
    let sumSquare = (x^2 + y^2)
        squareSum = (x + y)^2
    in  
        if sumSquare > squareSum 
            then sumSquare 
        else squareSum 

--as lambda
sumSquareLam x y = 
    (\x -> x^2) x + (\y -> y^2) y

squareSumLam x y = 
    (\x y -> (y + x)^2) x y 
--overwrite variable value
overwrite x = 
    let x = 2
    in
        let x = 3
        in 
            let x = 4
            in 
                x

--right to left so res is 4
overwrite2 x = 
    (\x ->(\x ->(\x -> x) 4) 3) 2

--lexical scope with add1, add2, add3
x = 4
add1 y = y + x
-- x is assigned 3
add2 y = (\x -> y + x) 3
-- y assigned 2, x assigned 1
add3 y = (\y -> (\x -> y + x) 1 ) 2

-- causes error
counter1 x = 
    let x = x + 1 
    in 
        let x = x + 1 in x

counter2 x = 
    (\x -> x + 1) ((\x -> x +1) x)


main :: IO()
main = do
    print (counter1 0)







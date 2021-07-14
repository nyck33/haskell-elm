module Unit1Ch2 where

inc :: Int -> Int 
inc x = do
    let y = x + 1
        in y

double :: Int -> Int 
double x = do
    let y = x * 2
        in y

square :: Int -> Int 
square x = do
    let y = x * x
        in y


evenOrOdd :: Int -> Int 
evenOrOdd n = 
    if checkEven n
        then n -2
    else
        3 * n + 1
    where checkEven n =
            n `mod` 2 == 0

easyEven :: Int -> Int 
easyEven n = 
    if even n 
        then n - 2
    else
        3 * n + 1
        

main :: IO()
main = do
    print (square 5)
    print (evenOrOdd 103)
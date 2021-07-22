module UnitCh3 where

--for sorting
import Data.List

--first class functions can be passed as arguments
-- and returned as values

--listing 4.3 ifEven
--ifEven :: f -> Int -> Int
ifEven someFunction x =
    if even x
        then someFunction x
    else 
        x

--functions to pass
inc n = n + 1
double n = n*2
square n = n^2

--functions have precedence over operators
add x y = x + y

compareFirstName name1 name2 = 
    if first1 > first2
        then GT 
    else if first1 < first2
        then LT 
    else EQ
    where first1 = fst name1
          first2 = fst name2

compareLastNames name1 name2 = 
    if lastName1 > lastName2
        then GT 
    else if lastName1 < lastName2
        then LT 
    else 
        compareFirstName name1 name2
    where lastName1 = snd name1
          lastName2 = snd name2

--Q4.1 rewrite compare using compare
compareLastNames2 name1 name2 | compareLastNames3 == EQ = compare first1 first2
                              | otherwise = compareLastNames3
    where
        lastName1 = snd name1
        lastName2 = snd name2
        first1 = fst name1
        first2 = fst name2
        compareLastNames3 = compare lastName1 lastName2

--Q4.2
names = [("Sayaka", "Toyoda"),("Mayu", "Sunter"),("Lina","Toyoda"),("Nobu","Kim")]

--Listing 4.6 addressLetter v.1
addressLetter name location = nameText ++ " - " ++ location
    where nameText = fst name ++ " " ++ snd name

--listing 4.8 getLocationFunction, return function for case
sfOffice name = if lastName < "L"
                then nameText ++ " - PO Box 1234 - SF, CA"
                else nameText ++ " - PO Box 1010 - SF, CA"
    where lastName = snd name
          nameText = fst name ++ " " ++ snd name

nyOffice name = nameText ++ ": PO Box 789 - NY, NY"
    where nameText = fst name ++ " " ++ snd name

dcOffice name = nameText ++ " " ++ "Washington, DC"
    where nameText = fst name ++ snd name ++ "Esq."

renoOffice name = nameText ++ " - PO Box 456 - Reno, NV"
    where nameText = fst name

--default case returns a lambda function
getLocationFunction location = case location of
    "ny" -> nyOffice
    "sf" -> sfOffice
    "reno" -> renoOffice
    "dc" -> dcOffice
    _ -> (\name -> (fst name) ++ " " ++ (snd name))

--new version
addressLetter2 name location = locationFunction name
    where locationFunction = getLocationFunction location



main :: IO()
main = do
    putStrLn  "add x y with 2 3"
    print (add 2 3) 
    putStrLn  "add 1 2 * 3"
    print (add 1 2 * 3)
    putStrLn "with lambda"
    print (ifEven (\x -> x*2) 6)
    print (ifEven (\x -> x^3) 2)
    print (sortBy compareLastNames names)


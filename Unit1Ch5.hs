module ClosuresIntro where
{-
ifEven :: f -> Int -> Int
ifEven someFunction x =
    if even x
        then someFunction x
    else 
        x
-}
--functions to pass
inc n = n + 1
double n = n*2
square n = n^2

ifEvenInc n = ifEven inc n
ifEvenDouble n = ifEven double n
ifEvenSquare n = ifEven square n

--fig. 5.1
--genIfEven f = (\x -> ifEven f x)

--5.1
ifEven f x = if even x then f x else x
{-order args from most to least general-}
genIfEven f = \x -> ifEven f x
--Q1.
genIfXEven x = \f -> ifEven f x 

--usage, ie. return a func that accepts func that's applied
--if x is even
genIf4Even = genIfXEven 4
genIf5Even = genIfXEven 5

--generating URLs for API
--ex. http://example.com/book/1234?token=1337hAsk311
getRequestURL host apiKey resource id = 
    host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

--Fig. 5.4 capturing the host value in a closure
genHostRequestBuilder host = 
    (\apiKey resource id -> getRequestURL host apiKey resource id) 

--usage
--exampleUrlBuilder = genHostRequestBuilder "http://example.com"
amazonUrlBuilder = genHostRequestBuilder "http://amazon.com"
-- use above so don't have to type amazon.com each time,
-- returns func that accepts apikey, resource, id

--api key input redundant so make another closure
--returns func that accepts resource and id for inputs hostBuilder, apikey
genApiRequestBuilder hostBuilder apiKey = 
    (\resource id -> hostBuilder apiKey resource id)
--this also works but textbook answer follows, ie. this returns
-- func genHostRequestBuilder that already is given the api_key parameter
amazonUrlBuilder2 = amazonUrlBuilder "api_key_Nobu"
--text wants this
amazonUrlBuilder3 = genApiRequestBuilder amazonUrlBuilder "api-key-text"

--Quick check 5.2
--Q1.
--return func that accepts  id only
genApiRequestBuilder2 hostBuilder apiKey resource = 
    (\id -> hostBuilder apiKey resource id)

amazonUrlBuilder4 = genApiRequestBuilder2 amazonUrlBuilder "my-api-key" "book"

--or parital application way
amazonUrlBuilder5 = amazonUrlBuilder "my-api-key" "dvd"

--QuickCheck 5.3
exampleUrlBuilder = getRequestURL "http://example.com" "1337hAsk3ll" "book"  

--return function that takes args in reverse order
flipBinaryArgs binaryFunction = (\x y -> binaryFunction y x)

--QuickCheck 5.4
--test flip
subtracter x y = x - y
weird = flip subtracter
two = 2
--use prefix (-), so this takes first 2 argument and flips them
flipGreeter = flip (++) "hello" "world"
-- flip takes a function and two arguments and flips the args
--flip :: (a -> b -> c) -> b -> a -> c

subtract2 = flip (-) 2
subtract2X x = flip (-) 2 x


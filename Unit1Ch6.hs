module Lists where

--build lists
myArr = 1: []
myLongArr = 1:[2,3,4]
myArr4 = 1:2:3:4:[]
myTupArr = (1,2):(3,4):(5,6):[]

--this results in ["h", "ello"]
helloWorld = "h": ["ello"]
--this does not "h":"ello"
--these work
helloWorld2 = 'h':[] ++ 'e':'l':'l':'o':[]

--gen list
myNumArr = [1 .. 10]
myOddArr = [1,3 .. 10]
myDecArr = [1,1.5 .. 5]
myNegArr = [1,0 .. -10]
--infinite list
infArr = [1 .. ]

--this compiles due to lazy evaluation but won't print
simple x = x
longList = [1 .. ]
stillLongList = simple longList
--so does this
backwardsInf = reverse[1..]

--list indexing with !!
num = [1,2,3] !! 1 --2
fourthLetter = "kitties" !! 4

--prefix indexing
numFirst = (!!) [1,2,3] 0

--partial application on left or right arg
paExample = (!!) "dog" --call paExample 2 for 'g'
paExample2 = ("dog" !!)
paExample3 = (!! 2) --call paExample3 "dog" for 'g'

--get length
myLen = length [1..20]

--find elem in list
isInList = elem 13 [0,13 .. 100]
charInList = elem 'p' "cheese"
-- or as infix with ``
respond phrase = if '!' `elem` phrase
    then "wow!"
    else "uh.. okay"

--listing 6.2
isPalindrome word = word == reverse word

--take elements from head
first5 = take 5 [2,4 .. 100]
first3Char = take 3 "wonderful"
--take gives what's available
takeWhatICan = take 100000 [1]
--take last 2
takeLast2 = take 2 (reverse [1,3 .. 100])

--takes last n and reverses so ascending res
takeLast n aList = reverse (take n (reverse aList))
takeLastDesc n aList = take n (reverse aList)

--remove first n elements
drop2 = drop 2 [1 .. 5]
drop5 = drop 5 "very awesome"

--zip
tupNumsArr = zip [1,3 .. 100] [0,2 .. 100]
--zip stops when one list runs out
zipWords = zip "cat" "elephant"

--cycle repeats list endlessly
ones n = take n (cycle [1])

--assign members to grps
assignToGroups n aList = zip groups aList
    where groups = cycle [1 .. n]

--Q6.1 repeat
-- cycle repeats an constant as constant not a 1 element list
repeatDiy n = cycle [n]

--Q6.2
subseq start end arr = take (end-1 - start) (drop start arr)

--Q6.3
inFirstHalf x xs = elem x (take (div (length xs) 2) xs) 
main::IO()
main = 
    do 
        print(assignToGroups 3 ["file1.txt","file2.txt","file3.txt"
                                ,"file4.txt","file5.txt","file6.txt","file7.txt"
                                ,"file8.txt"
                                ]
                                )
                



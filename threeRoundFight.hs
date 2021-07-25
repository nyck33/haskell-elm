{-
Get Programming with Haskell
Lesson 10
Extending the exercise
Write a threeRoundFight function that takes two robots and has them fight for three
rounds, returning the winner. To avoid having so many different variables for
robot state, use a series of nested lambda functions so you can just overwrite
robotA and robotB
-}

{-
Decided to make data Robot, coz original type signatures are mindblowing
Have no idea if this implementation is correct, can't find answers
-}

data Robot = Robot {name :: String, attack :: Int, hp :: Int} deriving Show
fight :: Robot -> Robot -> Robot
fight (Robot _ a1 _)  (Robot n a2 h) = Robot n a2 (h-a1)

crazyBob = Robot "Bob" 25 90
bigTom = Robot "Tom" 10 170

threeRoundFight :: Robot -> Robot -> Robot
threeRoundFight r1 r2 = 
    (\r1 r2 -> 
        (\r1 r2 -> fight r2 r1)
     r1 (fight r1 r2) 
    ) r1 r2

test = threeRoundFight crazyBob bigTom

{-
λ: test
Robot {name = "Bob", attack = 20, hp = 60}
-}
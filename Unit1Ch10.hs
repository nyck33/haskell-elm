module OOP where


--the original object that can be a
--return value
cup flOz = \msg -> msg flOz

aCup = cup 6
coffeeCup = cup 12

--fqOz not in scope?  still return flOz
getOz aCup = aCup (\flOz -> flOz)

--this does not work, always stuck at original amt
--drink aCup amt = aCup (\flOz -> flOz - amt)
--this returns a new cup object with flOz
drink' aCup amt = cup (flOz - amt)
    where flOz = getOz aCup

--limit sips when flOz is 0
drink'' aCup ozDrank = if ozDiff >= 0
                       then cup ozDiff
                       else cup 0
    where flOz = getOz aCup
          ozDiff = flOz - ozDrank

--listing 10.6
isEmpty aCup = getOz aCup == 0

--many sips
afterManySips = foldl drink'' coffeeCup [1,1,1,1,1]

--10.8 Robot, returns a lambda fn with the attribute tuple
robot (name, attack, hp) = (\message -> message (name, attack, hp))

--killerRobot is a lambda
killerRobot = robot ("Killer", 25, 300)
--accessors helpers, func that return first of tuple
name (n,_,_) = n 
attack (_,a,_) = a 
hp (_,_,hp) = hp
--accessors 10.10, func accepts a lambda containing tuple
--then calls lambda that calls func that returns member of tuple
getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHP aRobot = aRobot hp

--setters
setName aRobot newName = aRobot (\(n,a,h) -> robot (newName, a, h))
setAttack aRobot newAttack = aRobot (\(n,a,h) -> robot (n, newAttack, h))
setHP aRobot newHP = aRobot (\(n,a,h) -> robot (n, a, newHP))

--make new objects
nicerRobot = setName killerRobot "kitty"
gentleRobot = setAttack killerRobot 5
softerRobot = setHP killerRobot 50

printRobot aRobot = 
    aRobot (\(n,a,h) -> n ++ 
                        " attack:" ++ (show a) ++
                        " hp:" ++ (show h))

--robot fight
--take damage, returns new robot with HP - attackDamage
damage aRobot attackDamage = 
    aRobot (\(n,a,h) -> robot (n,a,h-attackDamage))

--example
afterHit = damage killerRobot 90
killerRobot' = getHP afterHit

--fight, returns new robot with HP - attackDamage
fight attacker defender = damage defender attackDamage --defender takes damage
    where attackDamage = if getHP attacker > 0  --if attacker has > 0 HP 
                            then getAttack attacker --get attack val
                         else 0 --cannot attack
--opponent
oppRobot = robot ("computer", 10, 300)

--fight
oppRound1 = fight killerRobot oppRobot
killerRound1 = fight oppRobot killerRobot
oppRound2 = fight killerRobot oppRound1
killerRound2 = fight oppRobot killerRound1

--Exercises
--use map
getHPRobotsArr robotsArr = map getHP robotsArr

robotsArr = [killerRobot, oppRobot, nicerRobot]

--3 round fight, use nested lambdas

toughRobot = robot ("toughie", 5, 120)
slyRobot = robot ("sly", 40, 50)

--https://gist.github.com/mikekeke/c6c2cd609acbca81da1ff9be547d3d2d
--https://stackoverflow.com/a/68508024/15825885
--return tuple of 2 robots damagedA and damagedB
oneRound a b = 
    (\damagedB -> (fight damagedB a, damagedB)) fight a b

threeRoundFight a b = oneRound (oneRound (oneRound (a, b)))

--robot ambush
ambusher = robot ("busher", 500, 50)
ambush = map (fight ambusher) robotsArr



    

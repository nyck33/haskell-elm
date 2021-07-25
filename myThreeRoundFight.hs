-- a robot object
robot (name, attack, hp) = (\message -> message (name, attack, hp))

--getters, setters and helpers

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

--take damage, returns new robot
damage aRobot attackDamage = 
    aRobot (\(n,a,h) -> robot (n,a,h-attackDamage))

fight attacker defender = damage defender attackDamage --defender takes damage
    where attackDamage = if getHP attacker > 0  --if attacker alive
                            then getAttack attacker --get attack val
                         else 0 --cannot attack

--https://stackoverflow.com/a/68508024/15825885
oneRound (a, b) = 
    (\damagedb -> (fight damagedb a, damagedb)) (fight a b)

threeRoundFight a b = oneRound (oneRound (oneRound (a, b)))

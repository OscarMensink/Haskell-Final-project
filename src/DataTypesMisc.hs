module DataTypesMisc where
--

data GameState = 
    MainMenu | LevelState | PauseState  

data MainMenu = MainMenu
  { title :: Text,
    buttons :: [Button],
    scores :: [Scores]
  }

data PauseState = PauseState
  { continue :: Button,
    return :: Button,
    pausedLevel :: LevelState --Is this possible and allowed?
  }

data LevelState = LevelState
  { player :: Player,
    enemies :: [Enemy],
    enemyProjectiles :: [FromEnemyProjectile], --Can be turned into a minimum Tree, as the closest one is the only one that could do damage to a player.
    playerProjectiles :: [FromPlayerProjectile],
    timeElapsed :: Float
  }


class Collision a  b where
    collision :: a -> b -> Bool -- 
    
instance Collision Player FromEnemyProjectile where
    collision p eP = undefined

instance Collision Player Enemy where
    collision p e = undefined

instance Collision Enemy FromPlayerProjectile where
    collision e pP = undefined

type FromEnemyProjectile :: Movable

class Update a where
    --update = a -> a

instance Update Player a where
    update a = a --currently no changes are mdae to the given player. This is an example of the possibilities with instances

    makeWall :: Rocket -> Wall
makeWall r = (r,
             r {rocket {body {hitbox (pos, (size (x,_)) =  hitbox (pos + x}}},
             r {rocket {body {hitbox (pos, (size (x,_)) =  hitbox (pos + 2 * x}}})
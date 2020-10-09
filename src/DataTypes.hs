module DataTypes where

data GameState = 
    MainMenu :: {

    } | 
    LevelState ::{
        player :: Player, enemies :: [Enemy], projectiles :: [Projectile] background :: [Objects]

    } | 
    PauseState :: {

    }

data Player {
    body :: Alive
    weapons :: (Weapon, Maybe Weapon, Maybe Weapon)
    playerNr :: Int
    pic :: Picture
}
data Enemy {
    body :: Alive
    movement :: Movement
    weapons :: Maybe Weapon -- not sure if we should use maybe in a data structure
    pic :: Picture
}
data Projectile {
    hitbox :: Hitbox
    body :: Alive
    direction :: Vector
}

data Alive {
    hitbox :: Hitbox
    direction :: Vector
    health :: Health
}

data Health :: Int

data Hitbox :: (Pos, Size)

data Size ::: (Float, Float)

data Pos :: (Float, Float)

data Vector :: (Float, FLoat)



class Update a where
    update = a -> a

instance Update Player a where
    update a = a --currently no changes are mdae to the given player. This is an example of the possibilities with instances
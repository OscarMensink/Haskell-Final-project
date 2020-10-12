module DataTypes where
--
data GameState = 
    MainMenu  {

    } | 
    LevelState {
        player :: (Player, Maybe Player), enemies :: [Enemy], projectiles :: [Projectile], background :: [Objects], timeElapsed :: Float

    } | 
    PauseState  { 
        levelstate :: LevelState 
    }

data Player = Player
    {
    body :: Movable ,
    weapons :: [Weapon],
    playerNr :: Int --Might never be used
}
data Enemy = Enemy
  { body :: Movable,
    weapons :: Maybe Weapon, -- not sure if we should use maybe in a data structure
    movement :: Movement,
    pic :: Picture --optional
  }

data Weapon ::{
    projectile :: Projectile,
    rateOfFire :: RateOfFire,
    direction :: Vector
}
data Projectile = Projectile {
    body :: Movable,
    hitpoints :: HitPoints
}

Projectile {body = Movable,hitpoints = 1}

data Movable = Movable {
    hitbox :: Hitbox,
    direction :: Vector,
    hitpoints :: HitPoints
} 

Movable1 {hitbox = (1.0,1),direction =(-1,0),hitpoints = 1}


data RateOfFire :: Int

data Hitpoints :: Int

data Hitbox :: (Pos, Size)

data Size :: (Float, Float)

data Pos :: (Float, Float)

data Vector :: (Float, FLoat)


class Update a where
    --update = a -> a

instance Update Player a where
    update a = a --currently no changes are mdae to the given player. This is an example of the possibilities with instances

    makeWall :: Rocket -> Wall
makeWall r = (r,
             r {rocket {body {hitbox (pos, (size (x,_)) =  hitbox (pos + x}}},
             r {rocket {body {hitbox (pos, (size (x,_)) =  hitbox (pos + 2 * x}}})
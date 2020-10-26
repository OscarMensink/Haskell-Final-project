module DataTypesLevel where

{-
    data LevelState = LevelState
  { player :: Player,
    enemies :: [Enemy],
    enemyProjectiles :: [FromEnemyProjectile], --Can be turned into a minimum Tree, as the closest one is the only one that could do damage to a player.
    playerProjectiles :: [FromPlayerProjectile],
    timeElapsed :: Float
  }
  -}

data Player = Player
  { pbody :: Movable,
    pweapons :: [PlWeapon],
    playerNr :: Int, --Might never be used
    pic :: Maybe Picture --optional
  } deriving (Show)

data Enemy = Enemy
  { ebody :: Movable,
    eweapons :: Maybe EnWeapon, -- not sure if we should use maybe in a data
    epic :: Maybe Picture --optional
  } deriving (Show)

type Picture = Int

data Movable = Movable -- projectile :: ((50.0,50.0),(1,1),(-3.0,0),1) enemy :: ((50.0,50.0),(1,1),(-3.0,0),2)
  { hitbox :: Hitbox,
    direction :: Vector,
    hitpoints :: Hitpoints
  } deriving (Show)

data Hitbox = Hitbox {position :: Pos, size :: Size} deriving (Show)

type Size = (Float, Float) --

type Pos = (Float, Float)

test :: Enemy
test =
  Enemy
    { ebody =
        Movable
          { hitbox =
              Hitbox
                { position = (50, 50),
                  size = (5.0, 5.0)
                },
            direction = (-3.0, 0.0),
            hitpoints = 1
          },
      eweapons = Nothing, -- not sure if we should use maybe in a data
      epic = Nothing --optional
    }

type Vector = (Float, Float)

type Hitpoints = Int

data Weapon = EnWeapon | PlWeapon

data EnWeapon = EnWeaponCon
  { eprojectile :: FromEnemyProjectile,
    erateOfFire :: RateOfFire,
    edirection :: Vector
  } deriving (Show)

data PlWeapon = PlWeaponCon
  { pprojectile :: FromPlayerProjectile,
    prateOfFire :: RateOfFire,
    pdirection :: Vector
  } deriving (Show)

newtype FromEnemyProjectile = FromEnemyProjectile {fepMoveable :: Movable} deriving (Show)
--standardProjectile :: FromEnemyProjectile {fepMoveable = Movable
--    { hitbox = Hitbox
--                { position = (50, 50),
--                  size = (5.0, 5.0)
 --               },
 --     direction = (-2.0, 0),
 --     hitpoints = 1
 --   }}
newtype FromPlayerProjectile = FromPlayerProjectile {fpMovable :: Movable} deriving (Show)

type RateOfFire = Float

-- From here we start looking into Functions

--creting en enemy test subject:
-- stsndar enemy moveable:
standardEnemyMovable :: Movable
standardEnemyMovable =
  Movable
    { hitbox = Hitbox
                { position = (50, 50),
                  size = (5.0, 5.0)
                },
      direction = (-2.0, 0),
      hitpoints = 1
    }

--standardEnemyWeapon :: EnWeapon
--standardEnemyWeapon =
--  EnWeaponCon
--    { eprojectile = , --fuuucckkk
--      erateOfFire = 1,
 --     edirection = (-1.0, 0.0)
--    }

class Movement a where
  movement :: a -> pos -> pos

instance Movement Player where
  movement p = undefined

instance Movement Enemy where
  movement = undefined

instance Movement FromEnemyProjectile where
  movement p x = undefined

instance Movement FromPlayerProjectile where
  movement p = undefined
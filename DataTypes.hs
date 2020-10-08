

data Player = Player {
    body   :: Hitbox, 
    weapons :: Weapons

}

class Update a where
     update :: a -> a 

instance Update Player where
    update = undefined
    
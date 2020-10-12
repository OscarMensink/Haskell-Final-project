-- | This module contains the data types
--   which represent the state of the game
module Model where

data InfoToShow
  = ShowNothing
  | ShowANumber Int
  | ShowAChar Char

nO_SECS_BETWEEN_CYCLES :: Float
nO_SECS_BETWEEN_CYCLES = 5

data GameState = GameState
  { infoToShow :: InfoToShow, --this is where the magic happens
    elapsedTime :: Float
  }

initialState :: GameState
initialState = GameState ShowNothing 0
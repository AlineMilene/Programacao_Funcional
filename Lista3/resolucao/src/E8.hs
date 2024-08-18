module E8 (Sem(..), next) where

-- Funcao next que recebe c :: SEm e devolve a cor que sucede c em um semáforo
-- Green -> Yellow -> Red -> Green

data Sem = Green | Yellow | Red
      deriving (Eq, Show)

next :: Sem -> Sem
next Green = Yellow
next Yellow = Red
next Red = Green

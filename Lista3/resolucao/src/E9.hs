module E9 (timeList, mapl) where

import E8 (Sem(..), next)

-- Função mapl, equivalente a map para listas comuns
mapl :: (a -> b) -> List a -> List b
mapl _ Nil = Nil
mapl f (x :- xs) = f x :- mapl f xs

-- Funcao timeList recebe xs :: List Sem e devolve o tempo que um automovel leva para atravessar xs 
timeList :: List Sem -> Int
timeList Nil = 0
timeList (x:-xs) =
      1 + timeList (mapl next xs2)
      where
            xs2 = if x == Red then x :- xs else xs
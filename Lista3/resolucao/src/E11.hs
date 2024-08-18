module E11 (timeListRedl) where

import E8 (Sem(..), next)
import E10 (redl)

timeListRedl :: List Sem -> Int
timeListRedl fst . redl foldFun (0, id)
    where
        foldFun (n, f) c
            | f c == Red = (n + 2, next . next . f)
            | otherwise = (n + 1, next . f)
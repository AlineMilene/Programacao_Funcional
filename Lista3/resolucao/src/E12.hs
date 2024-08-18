module E12 (timeListRedl) where

import E8 (Sem(..), next)
import E10 (redl)

data BT a = BEmpty | BNode a (BT a) (BT a)
    deriving Show

bleaf :: a -> BT a
bleaf x = BNode x BEmpty BEmpty

bt :: BT Sem
bt = BNode Green
    (
        BNode Green (bleaf Red) (bleaf Green)
    )
    (
        BNode Yellow (bleaf Red) (bleaf Green)
    )


module E2 (Tree(..), occurs) where

-- Definição do tipo Tree (árvore)
data Tree a = Leaf a | Node (Tree a) a (Tree a)
                deriving (Show)

-- Função occurs que verifica se um valor ocorre na árvore
occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y) = x == y
occurs x (Node left y right) =
    case compare y x of
        LT -> occurs x left
        EQ -> True
        GT -> occurs x right

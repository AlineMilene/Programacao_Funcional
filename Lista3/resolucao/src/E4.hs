module E4 (divList, balanced) where

import E2 (Tree(..))

divList :: [a] -> ([a], [a])
divList xs = divList' (length xs `div` 2) xs

-- Funcao balanced converte uma lista não vazia em uma árvore balanceada
balanced :: [a] -> Tree a
balanced [x] = Lead x
balanced xs = Node (balance ls) (balance rs)
      where (ls, rs) = divList xs


module E3 (flatten) where

import E2 (Tree(..))

-- Funcao flatten retorna uma lista ordenada com os elementos da arvore percorrida em ordem
flatten :: Tree a -> [a]
flatten (Leaf x) = [x]
flatten (Node left x right) = flatten left ++ [x] ++ flatten right
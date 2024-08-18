module E10 (foldl, redl) where

foldl :: (b -> a -> b) -> b -> List a -> b
foldl _ acc Nil = acc
foldl f acc (x :- xs) = foldl f (f acc x) xs

-- Funcao redl é uma versão da função foldl para valores do tipo List a: 
redl :: (b -> a -> b) -> b -> List a -> b
redl _ b Nil = b
redl f b (x :- xs) = redl f (f b x) xs

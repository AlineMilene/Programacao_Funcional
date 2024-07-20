module Main where

-- Exercicio 11
penultimo :: [a] -> a
penultimo [] = error ("Erro: Lista vazia")
penultimo [_] = error ("Erro: Lista com apenas um elemento")
penultimo as = as !! (length as - 2)

-- Exercicio 12
maximoLocal :: [Int] -> [Int]
maximoLocal xs
  | length xs < 3 = []
  | otherwise = [x | (x, prev, next) <- zip3 (tail (init xs)) (init xs) (drop 2 xs), x > prev && x > next]

-- Exercicio 13
fatores :: Int -> [Int]
fatores x = [i | i <- [1 .. (x `div` 2)], x `mod` i == 0]

isPerfeito :: Int -> Bool
isPerfeito x = sum (fatores x) == x

perfeitos :: Int -> [Int]
perfeitos n = [x | x <- [1 .. n], isPerfeito x]

-- Exercicio 14
produtoEscalar :: (Num a) => [a] -> [a] -> a
produtoEscalar xs ys = sum [x * y | (x, y) <- zip xs ys]

-- Exericicio 15
palindromo :: [Int] -> Bool
palindromo xs = xs == reverse xs

-- Exercicio 16
-- ordernaListas :: (Num a, Ord a) => [[a]] -> [[a]]

-- Exercicio 17
coord :: [a] -> [a] -> [(a, a)]
-- coord x y = [(i,j) | i <- x, j <- y]
coord x y = concat [[(i, j) | j <- y] | i <- x]

-- Exercicio 18

-- Exercicio 19
mcCarthy91 :: (Integral a) => a -> a
mcCarthy91 n
  | n > 100 = n - 10
  | otherwise = mcCarthy91 (mcCarthy91 (n + 11))

-- Exercicio 20
elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' x xs = x == head xs || elem' x (tail xs)

-- Exercicio 21
-- Exercicio 22
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x : xs) = x ++ concat' xs

-- concat' xs = foldr (++) [] xs
-- concat' = concat

-- Exercicio 23
-- Exercicio 24
-- Exercicio 25
-- Exercicio 26

-- Função Principal
main :: IO ()
main = do
  print (penultimo [1, 2, 3, 4]) -- imprime ex11
  print (maximoLocal [1, 3, 4, 2, 5]) -- imprime ex12
  print (perfeitos 500) -- imprime ex13
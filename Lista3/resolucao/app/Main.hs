module Main (main) where

import E1 (Nat(..), intToNat, natToInt, add, mult)
import E2 (Tree(..), occurs)
import E3 (flatten)

-- Exemplo de arvore
exampleTree :: Tree Int
exampleTree = Node (Leaf 1) 2 (Node (Leaf 3) 4 (Leaf 5))

-- Exemplo de lista
exampleList :: [Int]
exampleList = [1, 2, 3, 4, 5]

-- Construcao da arvore
exampleTree :: Tree Int
exampleTree = balance exampleList

main :: IO ()
main = do
    -- Exericicio 1
    let n1 = intToNat 4
    let n2 = intToNat 5
    let resultMult = mult n1 n2
    putStrLn ("4 * 5 = " ++ show (natToInt resultMult)) 

    -- Exercicio 2
    print (occurs 3 exampleTree)
    print (occurs 6 exampleTree)

    -- Exercicio 3
    print $ flatten exampleTree 


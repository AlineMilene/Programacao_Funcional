module E7 (testE7) where

import E6 (Tree(..))

-- Funcao arvorePossui que retorna caso o valor esteja na arvore
arvorePossui :: Eq t => t -> Tree t -> Bool
arvorePossui v (Leaf x) = v == x
arvorePossui v (Node e x d) = v == x || arvorePossui v e || arvorePossui v d

-- Função para testar as instâncias
testE7 :: IO ()
testE7 = do
    let tree1 :: Tree Int
        tree1 = Node (Leaf 1) 2 (Leaf 3)
        
        tree2 :: Tree Int
        tree2 = Node (Node (Leaf 4) 5 (Leaf 6)) 7 (Leaf 8)

    -- Testes
    let test1 = arvorePossui 2 tree1 -- Deve ser True
    let test2 = arvorePossui 1 tree1 -- Deve ser True
    let test3 = arvorePossui 3 tree1 -- Deve ser True
    let test4 = arvorePossui 4 tree1 -- Deve ser False
    let test5 = arvorePossui 5 tree2 -- Deve ser True
    let test6 = arvorePossui 8 tree2 -- Deve ser True
    let test7 = arvorePossui 9 tree2 -- Deve ser False

    -- Exibindo os resultados
    putStrLn $ "arvorePossui 2 tree1: " ++ show test1
    putStrLn $ "arvorePossui 1 tree1: " ++ show test2
    putStrLn $ "arvorePossui 3 tree1: " ++ show test3
    putStrLn $ "arvorePossui 4 tree1: " ++ show test4
    putStrLn $ "arvorePossui 5 tree2: " ++ show test5
    putStrLn $ "arvorePossui 8 tree2: " ++ show test6
    putStrLn $ "arvorePossui 9 tree2: " ++ show test7
module E8 (testE8) where

import E6 (Tree(..))

-- Funcao contaLetras que retorna uma arvore onde cada nó contem o comprimento da string 
contaLetras :: Tree String -> Tree Int
contaLetras = fmap length

-- Função para testar as instâncias
testE8 :: IO ()
testE8 = do
    -- Definindo árvores de strings
    let tree1 :: Tree String
        tree1 = Node (Leaf "hi") "hello" (Leaf "world")
        
        tree2 :: Tree String
        tree2 = Node (Node (Leaf "cat") "dog" (Leaf "fish")) "animal" (Leaf "tree")
    
    -- Aplicando a função contaLetras
    let result1 = contaLetras tree1
        result2 = contaLetras tree2
    
    -- Exibindo os resultados
    putStrLn "Árvore original (tree1):"
    print tree1
    putStrLn "Árvore com comprimentos (result1):"
    print result1
    
    putStrLn "Árvore original (tree2):"
    print tree2
    putStrLn "Árvore com comprimentos (result2):"
    print result2
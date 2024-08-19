module E6 (Tree(..), testE6) where

-- Instncia Functor para arvore binaria
data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving Show

instance Functor Tree where
    fmap f (Leaf v) = Leaf $ (f v)
    fmap f (Node e v d) = Node (fmap f e) (f v) (fmap f d)

-- Função para testar as instâncias
testE6 :: IO ()
testE6 = do
    let tree1 = Node (Leaf 1) 2 (Leaf 3)
        tree2 = Node (Node (Leaf 4) 5 (Leaf 6)) 7 (Leaf 8)
        -- Função que dobra os valores
        double x = x * 2

    -- Aplicando `fmap` com a função `double`
    let transformedTree1 = fmap double tree1
    let transformedTree2 = fmap double tree2

    -- Exibindo os resultados
    putStrLn "Original Tree1:"
    print tree1
    putStrLn "Transformed Tree1 (doubled values):"
    print transformedTree1

    putStrLn "Original Tree2:"
    print tree2
    putStrLn "Transformed Tree2 (doubled values):"
    print transformedTree2
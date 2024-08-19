module E4 (Lanche(..), Dieta(..),testE4) where

import E2 (Set(..))
import Data.Monoid ()

data Dieta = Vegano | Vegetariano | Tradicional
    deriving (Show, Eq)

data Lanche = Lanche (Set String) Int Dieta
    deriving (Show, Eq)

-- Instancia do Semigroup para Dieta
instance Semigroup Dieta where
    Vegano <> Vegano = Vegano
    Vegano <> Vegetariano = Vegetariano
    Vegetariano <> Vegano = Vegetariano
    Vegetariano <> Vegetariano = Vegetariano
    _ <> _ = Tradicional

-- Implementacao do Monoid para Dieta
instance Monoid Dieta where
    mempty = Vegano

-- Instancia do Semigroup para Lanche
-- i ingredientes
-- q quantidade
-- d dieta
instance Semigroup Lanche where
    Lanche i1 q1 d1 <> Lanche i2 q2 d2 = Lanche (i1 <> i2) (q1 + q2) (d1 <> d2)

-- Implementação do Monoid para Lanche
instance Monoid Lanche where
    mempty = Lanche mempty 0 Vegano


-- Função para testar as instâncias
testE4 :: IO ()
testE4 = do
    --- Testes para Semigroup
    let dieta1 = Vegano
        dieta2 = Vegetariano
        dieta3 = Tradicional

    putStrLn $ "Vegano <> Vegano: " ++ show (dieta1 <> dieta1) -- Deve imprimir "Vegano"
    putStrLn $ "Vegano <> Vegetariano: " ++ show (dieta1 <> dieta2) -- Deve imprimir "Vegetariano"
    putStrLn $ "Vegetariano <> Vegano: " ++ show (dieta2 <> dieta1) -- Deve imprimir "Vegetariano"
    putStrLn $ "Vegetariano <> Vegetariano: " ++ show (dieta2 <> dieta2) -- Deve imprimir "Vegetariano"
    putStrLn $ "Vegano <> Tradicional: " ++ show (dieta1 <> dieta3) -- Deve imprimir "Tradicional"
    putStrLn $ "Tradicional <> Vegano: " ++ show (dieta3 <> dieta1) -- Deve imprimir "Tradicional"
    putStrLn $ "Tradicional <> Vegetariano: " ++ show (dieta3 <> dieta2) -- Deve imprimir "Tradicional"

    -- Testes para Monoid
    putStrLn $ "mempty <> Vegano: " ++ show (mempty <> dieta1) -- Deve imprimir "Vegano"
    putStrLn $ "mempty <> Vegetariano: " ++ show (mempty <> dieta2) -- Deve imprimir "Vegetariano"
    putStrLn $ "mempty <> Tradicional: " ++ show (mempty <> dieta3) -- Deve imprimir "Tradicional"
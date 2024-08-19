module E5 (testE5) where

import E4 (Lanche(..), Dieta(..))
import E2 (fromList)
import Data.Monoid ()

-- Função para testar as instâncias
testE5 :: IO ()
testE5 = do
    let lanche1 = Lanche (fromList ["alface", "tomate"]) 1 Vegano
        lanche2 = Lanche (fromList ["queijo", "presunto"]) 2 Vegetariano
        lanche3 = Lanche (fromList ["bacon"]) 1 Tradicional

    -- Testes para Semigroup em Lanche
    let combinado1 = lanche1 <> lanche2
    putStrLn $ "Lanche1 <> Lanche2: " ++ show combinado1
    -- Deve imprimir: "Lanche {alface,tomate,queijo,presunto} 3 Vegetariano"

    let combinado2 = lanche2 <> lanche3
    putStrLn $ "Lanche2 <> Lanche3: " ++ show combinado2
    -- Deve imprimir: "Lanche {queijo,presunto,bacon} 3 Tradicional"

    -- Testes para Monoid em Lanche
    let combinado3 = mempty <> lanche1
    putStrLn $ "mempty <> Lanche1: " ++ show combinado3
    -- Deve imprimir: "Lanche {alface,tomate} 1 Vegano"

    let combinado4 = lanche1 <> mempty
    putStrLn $ "Lanche1 <> mempty: " ++ show combinado4
    -- Deve imprimir: "Lanche {alface,tomate} 1 Vegano"

    -- Teste adicional para garantir que `mempty` funciona corretamente
    let combinado5 = (mempty :: Lanche) <> (mempty :: Lanche)
    putStrLn $ "mempty <> mempty: " ++ show combinado5
    -- Deve imprimir: "Lanche {} 0 Vegano"
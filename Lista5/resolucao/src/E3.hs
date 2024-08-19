module E3 (testE3) where

import E2 (Set(..))
import Data.Monoid ()

-- Função para testar as instâncias
testE3 :: IO ()
testE3 = do
    -- Testes para Semigroup e Monoid
    let set6 :: Set Int
        set6 = Set [1, 2, 3] <> Set [3, 4, 5]
    putStrLn $ "Set [1,2,3] <> Set [3,4,5]: " ++ show set6 -- Deve imprimir "{1,2,3,4,5}"
    
    let set7 :: Set Int
        set7 = mempty <> Set [7, 8, 9]
    putStrLn $ "mempty <> Set [7,8,9]: " ++ show set7 -- Deve imprimir "{7,8,9}"
module E1 (Resultado(..), testE1) where

import Data.Monoid

-- Definição do tipo Resultado
data Resultado = Pontuacao Int | Cola
    deriving (Show)

-- Implementação do Semigroup para somar a pontuação das atividades de um aluno
instance Semigroup Resultado where
    (Pontuacao x) <> (Pontuacao y)  = Pontuacao (x + y)
    _ <> _                          = Cola

-- Implementação do Monoid para o tipo Resultado
instance Monoid Resultado where
    mempty = Pontuacao 0

-- Função para testar as instâncias
testE1 :: IO ()
testE1 = do
    let r1 = Pontuacao 10
    let r2 = Pontuacao 20
    let r3 = Cola
    print (r1 <> r2) -- Deve imprimir "Pontuacao 30"
    print (r1 <> r3) -- Deve imprimir "Cola"
    print (mempty <> r1) -- Deve imprimir "Pontuacao 10"
module E2 (Set(..), fromList, member, insert, delete, testE2) where

import Data.List (nub, sort)
import qualified Data.List as L (delete)

-- Definição do tipo Set
data Set a = Set [a]
    deriving (Eq)

-- Instância Show para o Set devolver algo como "{1,2,4}"
instance Show a => Show (Set a) where
    show (Set xs) = "{" ++ init (tail sl) ++ "}"
        where
            sl = show xs

-- Função fromList que gera um conjunto a partir de uma lista
fromList :: Ord a => [a] -> Set a
fromList xs = Set $ nub (sort xs)

-- Função member que retorna se um elemento pertence ao conjunto
member :: Ord a => a -> Set a -> Bool
member v (Set xs) = v `elem` xs 

-- Função insert que adiciona o elemento no conjunto
insert :: Ord a => a -> Set a -> Set a
insert v (Set xs) = fromList $ v : xs

-- Função delete para retirar o elemento do conjunto
delete :: Ord a => a -> Set a -> Set a
delete v (Set xs) = Set $ L.delete v xs

-- Instancia de Semigroup para Set
instance Ord a => Semigroup (Set a) where
    (Set xs) <> (Set ys) = fromList (xs ++ ys) 

-- Implementacao do Monoid para Set
instance Ord a => Monoid (Set a) where
    mempty = Set []
    
-- Função para testar as instâncias
testE2 :: IO ()
testE2 = do
    -- Teste para fromList
    let set1 :: Set Int
        set1 = fromList [3, 1, 2, 2, 3]
    putStrLn $ "fromList [3, 1, 2, 2, 3]: " ++ show set1 -- Deve imprimir "{1,2,3}"

    -- Teste para member
    let isMember :: Bool
        isMember = member 2 set1
    putStrLn $ "member 2 {1,2,3}: " ++ show isMember -- Deve imprimir "True"
    let isNotMember :: Bool
        isNotMember = member 4 set1
    putStrLn $ "member 4 {1,2,3}: " ++ show isNotMember -- Deve imprimir "False"

    -- Teste para insert
    let set2 :: Set Int
        set2 = insert 4 set1
    putStrLn $ "insert 4 {1,2,3}: " ++ show set2 -- Deve imprimir "{1,2,3,4}"
    let set3 :: Set Int
        set3 = insert 2 set1
    putStrLn $ "insert 2 {1,2,3}: " ++ show set3 -- Deve imprimir "{1,2,3}" (já existe 2)

    -- Teste para delete
    let set4 :: Set Int
        set4 = delete 2 set1
    putStrLn $ "delete 2 {1,2,3}: " ++ show set4 -- Deve imprimir "{1,3}"
    let set5 :: Set Int
        set5 = delete 4 set1
    putStrLn $ "delete 4 {1,2,3}: " ++ show set5 -- Deve imprimir "{1,2,3}" (4 não existe no conjunto)

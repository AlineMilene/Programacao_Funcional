module E1 (Nat(..), intToNat, natToInt, add, mult) where

-- Definição do tipo Nat
data Nat = Zero | Succ Nat

-- Funções auxiliares para conversão
intToNat :: Int -> Nat
intToNat 0 = Zero
intToNat n = Succ (intToNat (n - 1))

natToInt :: Nat -> Int
natToInt Zero = 0
natToInt (Succ n) = 1 + natToInt n

-- Função de adição
add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

-- Função de multiplicação
mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult (Succ m) n = add n (mult m n)
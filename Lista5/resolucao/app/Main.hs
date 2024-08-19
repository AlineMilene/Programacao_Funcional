module Main (main) where

import E1 (testE1)
import E2 (testE2)
import E3 (testE3)
import E4 (testE4)
import E5 (testE5)

main :: IO ()
main = do
    putStrLn "Testando Exercicio 1..."
    testE1
    putStrLn "\nTestando Exercicio 2..."
    testE2
    putStrLn "\nTestando Exercicio 3..."
    testE3
    putStrLn "\nTestando Exercicio 4..."
    testE4
    putStrLn "\nTestando Exercicio 5..."
    testE5
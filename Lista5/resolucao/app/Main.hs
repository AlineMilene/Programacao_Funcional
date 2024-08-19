module Main (main) where

import E1 (testE1)
import E2 (testE2)
import E3 (testE3)
import E4 (testE4)
import E5 (testE5)
import E6 (testE6)
import E7 (testE7)
import E8 (testE8)

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
    putStrLn "\nTestando Exercicio 6..."
    testE6
    putStrLn "\nTestando Exercicio 7..."
    testE7
    putStrLn "\nTestando Exercicio 8..."
    testE8
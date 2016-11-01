module VarA where

-- 1
-- Lista divizorilor unui numar
-- Folosind recursivitate
-- divsorsR 6 = [1, 2, 3 6]
divsors :: Int -> [Int]
divsors = undefined


-- 2
-- Lista divizorilor impari ai unui numar
-- Folosind list comprehension
oddDivisors :: Int -> [Int]
oddDivisors = undefined


-- 3
-- Testare daca un numar este perfect, adica egal cu suma divizorilor fara el insusi
-- Fara recursie sau list comprehension
-- isPerfect 6 = True    pt ca 6  == 1 + 2 + 3
-- isPerfect 10 = False  pt ca 10 \= 1 + 2 + 5
isPerfect :: Int -> Bool
isPerfect = undefined


-- 4
-- Testarea daca suma diferentelor elementelor consecutive este un nr perfect
-- perfDiffs [3, 4, 9] = True       pt ca [3-4, 4-9] ~> [1, 5] ~> 6
-- perfDiffs [1, 5, 8, 20] = False  pt ca [5-1, 8-5, 20-8] ~> [4, 3, 12] ~> 19
perfDiffs :: [Int] -> Bool
perfDiffs = undefined

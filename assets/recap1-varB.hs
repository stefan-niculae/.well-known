module VarB where

-- 1
-- Produsul diferentelor dintre oricare doua elemente consecutive
-- Folosind recursivitate
-- diffsProd [3, 1, 4, 2] = -12   pt ca [3, 1, 4, 2] ~> (3-1) * (1-4) * (4-2) ~> -12
diffsProd :: [Int] -> Int
diffsProd = undefined


-- 2
-- Semnul numerelor din lista aflate in intervalul [-9, 9]
-- Folosind list comprehension
-- signsInterv [5, 19, -2, 0] = "+-0"
signsInterv :: [Int] -> String
signsInterv = undefined


-- 3
-- Numarul total de vocale din cuvintele de lungime para
-- Folosing higher order functions (map, filter si fold)
-- evenVowels ["ana", "are", "mere", "si", "pere"] = 5
-- ["ana", "are", "mere", "si", "pere"] ~> ["mere", "si", "pere"] ~> ["ee", "i", "ee"] ~> [2, 1, 2] ~> 5
evenVowels :: [String] -> Int
evenVowels = undefined



-- 4
-- Lista factorilor primi unui numar
-- primeFactors 315 = [3, 3, 5, 7]
-- 315/3 ~> 105/3 ~> 35/5 ~> 7/7 ~> 1
primeFactors :: Int -> [Int]
primeFactors = undefined

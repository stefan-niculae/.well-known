module VarB where
import Control.Arrow

-- 1
-- Produsul diferentelor dintre oricare doua elemente consecutive
-- Folosind recursivitate
-- diffsProd [3, 1, 4, 2] = -12   pt ca [3, 1, 4, 2] ~> (3-1) * (1-4) * (4-2) ~> -12
diffsProd :: [Int] -> Int
diffsProd []  = 1  -- element neutru la inmultire
diffsProd [_] = 1  -- only one element left, can't compute any more differences
diffsProd (x:xs) = (x - head xs) * diffsProd xs


-- 2
-- Semnul numerelor din lista aflate in intervalul [-9, 9]
-- Folosind list comprehension
-- signsInterv [5, 19, -2, 0] = "+-0"
signsInterv :: [Int] -> String
signsInterv l = [sign x | x <- l, isInInterval x]
  where sign x
          | x > 0     = '+'
          | x < 0     = '-'
          | x == 0    = '0'
        isInInterval x = x >= -9 && x <= 9

-- Recursion
-- signsInterv [] = ""
-- signsInterv (x:xs)
--   | isInInterval x   = sign x : signsInterv xs
--   | otherwise      = signsInterv xs

-- Higher Order Functions
-- signsInterv  = filter isInInterval >>> map sign
-- signsInterv' = map sign . filter isInInterval   -- no Control.Arrow


-- 3
-- Numarul total de vocale din cuvintele de lungime para
-- Folosing higher order functions (map, filter si fold)
-- evenVowels ["ana", "are", "mere", "si", "pere"] = 5
-- ["ana", "are", "mere", "si", "pere"] ~> ["mere", "si", "pere"] ~> ["ee", "i", "ee"] ~> [2, 1, 2] ~> 5
evenVowels :: [String] -> Int
evenVowels = filter (even . length) >>> map onlyVowels >>> map length >>> sum
    where isVowel = (`elem` "aeiou")
          onlyVowels = filter isVowel



-- 4
-- Lista factorilor primi unui numar
-- primeFactors 315 = [3, 3, 5, 7]
-- 315/3 ~> 105/3 ~> 35/5 ~> 7/7 ~> 1
primeFactors :: Int -> [Int]
primeFactors 1 = []  -- one has no factors but it is not prime
primeFactors n
  | factors == []   = [n] -- no factors, the number is prime
  | otherwise       = smFact : primeFactors (n `div` smFact)  -- divide by the smallest factor
    where smFact  = head factors
          factors = filter (\d -> (n `mod` d) == 0) [2..n-1]

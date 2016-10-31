module VarA where
import Control.Arrow

-- 1a
-- Lista divizorilor unui numar
-- Folosind recursivitate
-- divsorsR 6 = [1, 2, 3 6]
divsors :: Int -> [Int]
divsors n = helper 1  -- start with candidate 1
  where helper cand
          | cand == n          = [n]
          | n `mod` cand == 0  = cand : helper (cand+1)
          | otherwise          = helper (cand+1)  -- move to the next candidate

-- 2
-- Lista divizorilor impari ai unui numar
-- Folosind list comprehension
oddDivisors :: Int -> [Int]
oddDivisors n = [ cand | cand <- [1..n], n `mod` cand == 0, odd cand ]

-- 2 Bonus
-- Folosind higher order functions
oddDivisors' :: Int -> [Int]
oddDivisors' n = filter (\cand -> n `mod` cand == 0 && odd cand) [1..n]


-- 3
-- Testare daca un numar este perfect, adica egal cu suma divizorilor fara el insusi
-- Fara recursie sau list comprehension
-- isPerfect 6 = True    pt ca 6  == 1 + 2 + 3
-- isPerfect 10 = False  pt ca 10 \= 1 + 2 + 5
isPerfect :: Int -> Bool
isPerfect n = n == sum (filter(\cand -> n `mod` cand ==0) [1..n-1])


-- 4
-- Testarea daca suma diferentelor elementelor consecutive este un nr perfect
-- perfDiffs [3, 4, 9] = True       pt ca [3-4, 4-9] ~> [1, 5] ~> 6
-- perfDiffs [1, 5, 8, 20] = False  pt ca [5-1, 8-5, 20-8] ~> [4, 3, 12] ~> 19
perfDiffs :: [Int] -> Bool
perfDiffs = consecPairs >>>  map pairDiff >>> sum >>> isPerfect
  where consecPairs l = tail l `zip` l  -- [1, 2, 3] ~> [2, 3] `zip` [1, 2, 3] ~> [(2, 1), (3, 2)]
        pairDiff (a, b) = a - b

-- without Control.Arrow
perfDiffs' :: [Int] -> Bool
perfDiffs' l = isPerfect . sum . map pairDiff $ consecPairs
  where consecPairs = tail l `zip` l
        pairDiff = uncurry (-)  -- uncurry converts a curried function to a function on pairs

module Domeniu (Dom,
                exist,
                overlap,
                normalize,
                optimize) where
data Dom a = Empty
           | Ran a a
           | (Dom a) :|: (Dom a)  -- reuniune
           | (Dom a) :&: (Dom a)  -- intersectie
           deriving (Show, Read)


-- 1
exist :: Ord a => a -> Dom a -> Bool
exist _ Empty       = False
exist x (Ran a b)   = a <= x && x <= b
exist x (i1 :|: i2) = exist x i1 || exist x i2
exist x (i1 :&: i2) = exist x i1 && exist x i2


-- 2
overlap :: Ord a => Dom a -> Dom a -> Bool
overlap (Ran a b) (Ran c d) =
  (a <= c && c <= b) ||  -- a < c < b
  (a <= d && d <= b) ||  -- a < d < b
  (c <= a && a <= d) ||  -- c < a < d
  (c <= b && b <= d)     -- c < b < d
overlap _ _ = False


-- 3
normalize :: Ord a => Dom a -> Dom a
normalize Empty = Empty
normalize r@(Ran _ _) = r
normalize ((x :|: y) :&: z) = normalize (x :&: z) :|: normalize (y :&: z)
normalize (x :|: y) = normalize x :|: normalize y
normalize (x :&: y) = normalize x :&: normalize y


-- 4
optimize :: Ord a => Dom a -> Dom a
optimize Empty = Empty
optimize r@(Ran _ _) = r
optimize (x :|: Empty) = optimize x  -- U
optimize (Empty :|: x) = optimize x  -- U
optimize (_ :&: Empty) = Empty
optimize (Empty :&: _) = Empty
optimize r@(Ran a b :|: Ran c d)  -- U
  | overlap (Ran a b) (Ran c d) = Ran (min a c) (max b d)
  | otherwise = r
optimize (Ran a b :&: Ran c d)
  | overlap (Ran a b) (Ran c d) = Ran (max a c) (min b d)
  | otherwise = Empty
optimize (x :|: y) = optimize $ optimize x :|: optimize y
optimize (x :&: y) = optimize $ optimize x :&: optimize y


-- 5
{-
  module Principal where
 from Domeniu import (Dom, optimize)
-}
main :: IO (Dom Int)
main = do
  line <- getLine
  let d = read line :: Dom Int
  return (optimize d)

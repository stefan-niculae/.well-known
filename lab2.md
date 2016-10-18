# Lab 2

Covers lists, recursion and advanced function syntax.

## Lists

**Empty** list: `[]`

**Prepending**:

```haskell
> 1 : [2, 3]
[1, 2, 3]

> 'a' : "bcd"
"abcd"
```

**Appending**/concatenating:

```haskell
> [1, 2] ++ [3, 4]
[1, 2, 3, 4]

> [1] ++ [2, 3]
[1, 2, 3]

> "ab" ++ "cd"
"abcd"
```

**Extracting**:

```haskell
> head [1, 2, 3]
1

> tail [1, 2, 3]
[2, 3]
```

**Signature** types:

```haskell
squares :: [Int] -> [Int]  -- takes a list of integers and returns a list of integers
```



## Recursion

_Square every element_: `squares [1, 2, 3]` is ` [1, 4, 9]`

Manipulating elements in a list one by one, the following are equivalent:

```haskell
-- descriptive, list comprehension
squares xs = [x^2 | x <- xs]  -- x^2 is equivalent to x*x

-- equational recursion
squares []     = []
squares (x:xs) = x^2 : squares xs  -- list with head x and tail xs

-- conditional recursion
squares l = 
  if l == [] then []
  else x^2 : squares xs
    where x  = head l
          xs = tail l
          
-- conditional recursion (with let..in)
squares l =
  if l == [] then []
  else let x  = head l
           xs = tail l
       in x^2 : squares xs
```



_Square only even elements_: `squareEvens [1, 2, 3, 4]` is `[4, 16]` 

Manipulating elements _if_ they match a condition, the following are equivalent:

```haskell
-- descriptive
squareEvens xs = [x^2 | x <- xs, even x]  -- 'even' is a built-in equivalent to (x `mod` 2 == 0)

-- pattern matching
squareEvens [] = []
squareEvens (x:xs)
  | even x    = x : squareEvens xs
  | otherwise = squareEvens xs
```



## High order functions

Functions that take other functions as arguments:

```haskell
> map double [1, 2, 3]  -- apply the function to each element in the list
[2, 4, 6]

> filter isDivisible [1, 2, 3, 4, 5, 6]  -- only keep elements where the function returns True
[3, 6]

> foldl customAdd 100 [1, 2, 3]  -- aggeregate elements with the given function starting with the initial value
136   -- 100(initial) + 1(first element) +10(from customAdd)   +   2 +10   +   3 +10
```

This way, the above functions can be rewritten as:

```haskell
squres xs = map square xs
squareEevens xs = map square (filter even xs)
```



## Function composition

The following definitions are equivalent:

```haskell
compound x = double(add5 (x))
compound x = (double . add5) x
compound x = double . add5 $ x  -- different way, less parentheses
compound = double . add  -- ommit the argument all-together

> compound 10
30  -- add5 (becomes 15) then double (becomes 30)
```

This way, the above can be rewritten as:

```haskell
squares = map square
squareEvens = map square . filter even
```



## Lambdas and short-hands

A lambda is an anonymous function, the following are all equivalent:

```haskell
> map double [1, 2, 3]
> map (\x -> x * 2) [1, 2, 3]  -- because \ kind-of looks like a little lambda
> map (*2) [1, 2, 3]  -- currying (more in later labs)

[1, 4, 9]  -- all three yield the same thing
```

This way, the above can be rewritten as:

```haskell
squares = map (^2)
squareEvens = map (^2) . filter even
```

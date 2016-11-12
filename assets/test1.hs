module Test1 where
import Data.Char
import Data.List
import Control.Arrow


{-
Cenzurare nume proprii (care incep cu litera mare)
Folosind recursivitate

> cenzNume "Dan stie locul"
"D** stie locul"
-}
cenzNume :: String -> String
cenzNume "" = ""
cenzNume [c] = [c]
cenzNume (f:s:r)
  | (isUpper f || f == '*') && s /= ' '  = f : cenzNume ('*':r)
  | otherwise                            = f : cenzNume (s:r)



{-
Cenzurare numere - inlocuire fiecare cifra dintr-un string cu X

ex:
> cenzNr "suna la 0722"
"suna la XXXX"
-}
cenzNrLC, cenzNrHOF :: String -> String

-- var A: Folosind list comprehension
cenzNrLC s = [if isDigit c then 'X' else c | c <- s]

-- var B: Folosind higher order functions
cenzNrHOF = map (\c -> if isDigit c then 'X' else c)




{-
> parseInt "123"
123
-}
parseInt :: String -> Int
parseInt inp
  | all isDigit inp  = helper (reverse inp) 0
  | otherwise        = error "The contains characters other than digits"
    where helper "" _ = 0
          helper (c:cs) pow = (digitToInt c * 10^pow) + helper cs (pow+1)


{-
Valoarea totala a valutei straine (nu lei) dintr-un string,
Rata de conversie este data de functia rata
Hint1: puteti folosi functia words. ex: words "ab cd ef" = ["ab", "cd", "ef"]
Hint2: puteti folosi functia parseInt

> valLei "10l si 100E plus 1$"
403  -- 10 lei ignorat + 100*4 eur + 1*3 dolari
-}
rata :: Char -> Int
rata '$' = 3  -- dolari
rata 'E' = 4  -- euro
rata 'L' = 5  -- lire

valLeiLC, valLeiHOF, valLeiHOF2, valLeiHOF3 :: String -> Int

-- var B: Folosind list comprehension
valLeiLC s = sum [converted w | w <- words s, isMoney w, last w /= 'l']
  where isMoney str = all isDigit (init str)
        converted money = parseInt (init money) * rata (last money)

-- var A: Folosind higher order functions
valLeiHOF = words >>> filter isMoney >>> filter (last >>> (/= 'l')) >>> map converted >>> sum
  where isMoney str = all isDigit (init str)
        converted money = parseInt (init money) * rata (last money)

valLeiHOF2 = sum . map converted . filter ((/= 'l') . last) . filter isMoney . words
  where isMoney str = all isDigit (init str)
        converted money = parseInt (init money) * rata (last money)

valLeiHOF3 s = sum (map converted (filter (\w -> isMoney w && last w /= 'l') (words s)))
  where isMoney str = all isDigit (init str)
        converted money = parseInt (init money) * rata (last money)



exConv :: [(String, String)]
exConv = [ -- exemplu de conversatie
  ("inspector John", "Aminteste-mi pretul"),
  ("Victor",         "500$ pe langa cei 200E"),
  ("inspector John", "Batem palma")
  ]
{-
Pentru o conversatie data ca o lista de (Persoana, Mesaj):
 - cenzureaza valorile monetare din mesaje (folosind functia cenzNr)
 - cenzureaza numele infractorilor (folosind functia cenzNume)
   numele politistilor se deosebesc de cele ale infractorilor prin faptul
   ca incep cu una din functiile din lista funcPolitie

Intoarce o pereche formata din:
 - concatenarea tuturor replicilor in forma Pers1: Mesaj1; Pers2: Mesaj2; ...
 - suma totala discutata, in lei  (folosind functia valLei)


> cenz exConv  -- exemplu de conversatie definit mai sus
("inspector John: Aminteste-mi pretul;
 V*****: XXX$ pe langa cei XXXE;
 inspector John: Batem palma;",
 2300)  -- 500$ + 200E in lei
-}

funcPolitie :: [String]
funcPolitie = ["inspector", "general", "ofiter"]

valLei = valLeiHOF
cenzNr = cenzNrHOF

cenzA :: [(String, String)] -> (String, Int)
cenzA conv = (concat replies, sum bani)
  where replies = [cenzInfrac pers ++ ": " ++ cenzNr msg ++ ";" | (pers, msg) <- conv]
        cenzInfrac p = if any (`isPrefixOf` p) funcPolitie then p else cenzNume p
        bani = [valLei m | (_, m) <- conv]



{-
Pentru o conversatie data ca o lista de (Persoana, Mesaj):
 - cenzureaza valorile monetare din mesaje (folosind functia cenzNr)
 - cenzureaza numele politistilor (folosind functia cenzNume)
   numele politistilor se deosebesc de cele ale infractorilor prin faptul
   ca incep cu una din functiile din lista funcPolitie

Intoarce o pereche formata din:
 - concatenarea tuturor replicilor in forma Pers1: Mesaj1;   Pers2: Mesaj2;   ...
 - maximul valorilor discutate, in lei (folosind functia valLei)


> cenz2 exConv  -- exemplu de conversatie definit mai sus
("inspector J***: Aminteste-mi pretul;
 Victor: XXX$ pe langa cei XXXE;
 inspector J***: Batem palma;",
 1500)  -- 500$ = 1500 lei, 200E = 800 lei
-}
cenzB :: [(String, String)] -> (String, Int)
cenzB conv = (concat replies, maximum bani)
  where replies = [cenzPol pers ++ ": " ++ cenzNr msg ++ ";" | (pers, msg) <- conv]
        cenzPol p = if any (`isPrefixOf` p) funcPolitie then cenzNume p else p
        bani = [valLei m | (_, m) <- conv]

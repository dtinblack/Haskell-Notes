{- Examples of functions using the point-free style -}

{-

Notes:

To run > ghci pointfree.hs

-}

import Prelude hiding ((.), abs, sqrt)

-- composition operator ( 'f' following 'g' or 'f circle g' )

(.) :: (b -> c) -> (a -> b) -> a -> c    -- bluebird
(.) = \f g x -> f (g x)

-- example of using the composition operator

sumWithMap = sum . map (*2)


-- example of applying a function to the result of applying a function with two inputs

(...) :: (c -> d) -> (a -> b -> c) -> a -> b -> d
(...) = \f g x y -> f ( g x y )

aggregate = sum ... map


-- oo :: (c -> d) -> (a -> b -> c) -> a -> b -> d    -- blackbird
-- oo = \f g x y -> f ( g x y )

-- can be used "(oo f g) 1 2" or "( f `oo` g) 1 2"

-- aggregate :: (Foldable ((->) ([b] -> d)), Num (((a -> b) -> [a] -> [b]) -> (a -> b) -> [a] -> d)) => (a -> b) -> [a] -> d
-- aggregate = sum `oo` map

-- examples of applying the '...' function to distance calculations

sqr :: (Num a) => a -> a
sqr x = x * x

sqrt :: (Floating a) => a -> a
sqrt x = x ** 0.5

abs :: (Num a, Ord a) => a -> a
abs x = if x >= 0 then x else -x

euclidean = sqrt . aggregate sqr

exEuclidean = euclidean [5,5,5,5,5]         -- five dimensions

manhatten = id . aggregate abs

exManhatten = manhatten [5,5,5,5,5]

-- example of applying a function to two arguments that are the result of
-- applying a function to to two arguments

(.*.) :: (b -> b -> c) -> ( a -> b ) -> a -> a -> c
(.*.) = \f g x y -> f (g x) (g y)

multLengthLists :: Foldable t => t a -> t a -> Int
multLengthLists = (*) .*. length

exMultLengthLists = multLengthLists [1,2,3] [4,5,6,7,8,9]

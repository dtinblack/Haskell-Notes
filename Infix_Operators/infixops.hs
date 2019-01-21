{- Infix Operators -}

{-

Notes:

To run: ghci infixops.hs

In the addition etc. for complex numbers the as-pattern symbol '@' is used which
works as a means to duplicate a pattern, see the following example:

*Main> f (x:xs) = x:x:xs
*Main> f [1,2,3]
[1,1,2,3]
*Main> g s@(x:xs) = x:s
*Main> g [1,2,3]
[1,1,2,3]

-}


-- example of left associative infixl

multandinc :: (Num a) => a -> a -> a
multandinc x y = x * y + 1

infixl 5 *+
(*+) = multandinc

{- sequence of calculations

2 *+ 3 *+ ( 3 + 1 )   --  '+' is higher precedence ( 6 ) than '!!' ( 5 )
(2 *+ 3 ) *+ 4        -- operators at same precedence therefore compute '2 !! 3'
7 *+ 4
29

-}

res1 = 2 *+ 3 *+ 3 + 1


-- example of right associative infixr

{- sequence of calculations

2 *- (3 *- 3) + 1
(2 *- 10) + 1
21 + 1
23

-}

infixr 7 *-
(*-) = multandinc

res2 = 2 *- 3 *- 3 + 1


{-

*Main> tst :: Complex Float; tst = 1.0 :+ 2.0
*Main> tst
1.0 :+ 2.0
*Main>

-}


-- example of using infix type constructor - Complex Numbers

infix 6 :+

data (RealFloat a ) => Complex a = !a :+ !a
                    deriving (Show, Eq, Read)

-- extract the real and imaginary parts of the complex number

realPart, imagPart :: ( RealFloat a ) => Complex a -> a
realPart (x :+ y ) = x
imagPart (x :+ y ) = y

magnitude :: ( RealFloat a) => Complex a -> a
magnitude (x :+ y) =
           scaleFloat k ( sqrt( (scaleFloat mk x)^2 + (scaleFloat mk y)^2) )
           where k = max (exponent x)(exponent y)
                 mk = - k

instance (RealFloat a) => Num (Complex a) where
       (x :+ y) + (x' :+ y') = (x + x') :+ (y + y')
       (x :+ y) * (x' :+ y') = (x * x' - y * y') :+ (x * y' + y * x')
       (x :+ y) - (x' :+ y') = (x - x') :+ (y - y')
       abs z = magnitude z :+ 0
       signum 0 = 0
       signum z@(x:+y)     =  x/r :+ y/r  where r = magnitude z
       fromInteger n       =  fromInteger n :+ 0


c1 :: Complex Float
c1 = 1.0 :+ 2.0

c2 :: Complex Float
c2 = 3.0 :+ 5.0

res3 = c1 + c2

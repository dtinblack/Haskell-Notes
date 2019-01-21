## Infix Operators

There are two aspects to infix operators: precedence and associativity.

### Precedence

Precedence, or operator binding, is the order which an operator is applied, see an example of a [table of precedence used in Haskell](https://rosettacode.org/wiki/Operator_precedence#Haskell) where 0 is the lowest and 9 is the highest. For example, using <i>:info</i> in GHCi:

```{haskell}
*Main> :info (+)
class Num a where
  (+) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Num’
infixl 6 +

*Main> :info (*)
class Num a where
  ...
  (*) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Num’
infixl 7 *

```
shows that multiplication has higher precedence than addition, therefore

```{haskell}
*Main> 2 * 4 + 4 * 5 == 28
True

```

### Associativity

[Associativity](https://en.wikipedia.org/wiki/Operator_associativity), or fixity, of an operator is a property that determines how operators of the same precedence are grouped in the absence of parentheses.

- Left-Associativity is when a binary operators application in an application can be grouped together from the left to the right without affecting the expression’s meaning.

- Right-Associativity is when a binary operators application in an application can be grouped together from the right to the left

- Full-Associativity is when a binary operator is fully-associative i.e. it is both left- and right-associative.

- Non-Associativity is when a binary operator is non-associative i.e. it is neither left- nor right-associative.

See examples of the above in [infixops.hs](/Infix_Operators/infixops.hs)


### Further Notes

[Custom Infix Operators in Haskell](https://csinaction.com/2015/03/31/custom-infix-operators-in-haskell/) - describes precedence and fixity with examples.

[Ten Things You Should Know About Haskell Syntax](https://www.fpcomplete.com/blog/2012/09/ten-things-you-should-know-about-haskell-syntax) - clear description about the subtleties of Haskell syntax, including function application has precedence over operators. For example,

```{haskell}
f a b c + g d e
```

is interpreted as the sum of two functions <i>f</i> and <i>g</i>.

[Infix Functions In Haskell](https://wuciawe.github.io/functional%20programming/haskell/2016/07/03/infix-functions-in-haskell.html) - examples of infix functions.

[Haskell: Why aren't infix type constructors allowed?](https://stackoverflow.com/questions/30039123/haskell-why-arent-infix-type-constructors-allowed)
- discussion about infix type constructors ( see example in Haskell file ).


### Licence

[See Licence](/LICENSE)

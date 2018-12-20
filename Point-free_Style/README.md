# Point-free Style

[Point-free](https://en.wikipedia.org/wiki/Tacit_programming) is a style of programming in which function definitions do not include arguments ( or "points"). Without the arguments the code concentrates on functions rather than the data structures and therefore produces code that should be easier to understand.

Examples:

Conventional approach where the arguments for the function are explicit:

```{haskell}
sum (x:xs) = x + (sum xs)
sum [] = 0
```

Point-free doesn't have any explicit arguments for the function:

```{haskell}
sum = foldr (+) 0
```

In the accompanying code [pointfree.hs](/Point-free_Style/pointfree.hs) examples are given of using the point-free style in function combinators, including composition.

## Further Notes

The presentation [Point-Free or Die: Tacit Programming in Haskell and Beyond](https://www.youtube.com/watch?v=seVSlKazsNk) gives more examples of using the point-free style to produce understandable code for complex problems.

## Licence

[See Licence](/LICENSE)

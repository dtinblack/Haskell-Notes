# Point-free Style

"Point-free style is a programming paradigm in which function definitions do not include the arguments ( or "points")" - [Wikipedia: Tacit Programming](https://en.wikipedia.org/wiki/Tacit_programming)

Point-free can help in giving clear steps when reasoning about a function.

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

## Licence

[See Licence](/LICENSE)

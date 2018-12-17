# Point-free Style

"Point-free style is a programming paradigm in which function definitions do not include the arguments ( or "points")" - [Wikipedia: Tacit Programming](https://en.wikipedia.org/wiki/Tacit_programming)

Point-free can help in giving clear steps when reasoning about a function. For example functions can be composed of other functions and using the point-free style gives clearer code.

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

[check code](/pointfree.hs)

## Further Notes

In the video [Point-Free or Die: Tacit Programming in Haskell and Beyond](https://www.youtube.com/watch?v=seVSlKazsNk) there is a presentation about the use of the point-free style and how it can be used to make code easier to read and therefore understand.  The example discussed in the video is taken from []

## Licence

[See Licence](/LICENSE)

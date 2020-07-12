# Exercise: PatternMatching-1

Which of the following will match?

- `a = [1, 2, 3]`
- `a = 4`
- `4 = a`
- `[a, b] = [1, 2, 3]`
- `a = [[1, 2, 3]]`
- `[a] = [[1, 2, 3]]`
- `[[a]] = [[1, 2, 3]]`

## Answer

- [x] `a = [1, 2, 3]`
- [x] `a = 4`
- [x] `4 = a`
- [ ] `[a, b] = [1, 2, 3]`
  > This will try to match a list with 3 elements
- [x] `a = [[1, 2, 3]]`
- [x] `[a] = [[1, 2, 3]]`
- [ ] `[[a]] = [[1, 2, 3]]`
  > This will try to match a inner list with 1 element as the first item of the outer list

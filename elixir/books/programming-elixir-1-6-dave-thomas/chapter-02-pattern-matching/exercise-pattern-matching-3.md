# Exercise: PatternMatching-3

The variable `a` is bound to the value `2`. Which of the following will match?

- `[ a, b, a ] = [ 1, 2, 3 ]`
- `[ a, b, a ] = [ 1, 1, 2 ]`
- `a = 1`
- `^a = 2`
- `^a = 1`
- `^a = 2 - a`

## Answer

- [ ] `[ a, b, a ] = [ 1, 2, 3 ]`
  > 1 != 3
- [ ] `[ a, b, a ] = [ 1, 1, 2 ]`
  > 1 != 2
- [x] `a = 1`
- [x] `^a = 2`
- [ ] `^a = 1`
  > 2 != 1 (^a resolves to 2, as it's the value of a)
- [ ] `^a = 2 - a`
  > 2 != 0

# The variable a is bound to the value 2. Which of the following will match?
# does not match - 1 != 3
[a, b, a] = [1, 2, 3]
# does not match - 1 != 2
[a, b, a] = [1, 1, 2]
# matches, a becomes 1
a = 1
# matches, since a is bound to 2 and 2 = 2
^a = 2
# does not match - 2 != 2
^a = 1
# does not match - 2 != 0
^a = 2 - a

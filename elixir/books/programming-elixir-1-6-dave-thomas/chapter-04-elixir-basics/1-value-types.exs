ioi = &IO.inspect/1

# The value types in Elixir 
#  represent numbers, names, ranges, and regular expressions.

###########
# Numbers - Integers
###########
decimal = 1234
hexadecimal = 0xCAFE
octal = 0o755
binary = 0b1111

underscores_sep = 100_000_000

###########
# Numbers - Floating Points
###########
floating_point = 0.1234

###########
# Atoms
###########
:ok

###########
# Ranges
###########
1..100

###########
# Regex
###########
regex = ~r{[aeiou]}
word = "cartepillar"
# executes the regex and returns the first match
ioi.(Regex.run(regex, word))
# matches the regex until the end, returns a list of lists
ioi.(Regex.scan(regex, word))
# [["a"], ["e"], ["i"], ["a"]]
# Split the string on each matching char
ioi.(Regex.split(regex, word))
# Replace
ioi.(Regex.replace(regex, word, "*"))

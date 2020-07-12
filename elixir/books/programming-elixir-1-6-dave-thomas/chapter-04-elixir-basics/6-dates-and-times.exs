ioi = &IO.inspect/1

# The Date type holds a year, a month, a day, and a reference to the ruling calendar.
{:ok, d1} = Date.new(2018, 03, 05)
ioi.(d1)

# The sequences ~D[...] and ~T[...] are examples of Elixir’s sigils. They are a way of constructing literal values.
d2 = ~D[2019-03-05]
ioi.(d2)
ioi.(d1 == d2)

# Ranges
date_range = Date.range(d1, d2)
# how many days?
ioi.(Enum.count(date_range))
# is day inside range?
ioi.(~D[2019-01-01] in date_range)

# Time
# The Time type contains an hour, a minute, a second, and fractions of a second.
# The fraction is stored as a tuple containing microseconds and the number of
#  significant digits.
{:ok, t1} = Time.new(12, 34, 56)
ioi.(t1)

t2 = ~T[12:34:56.78]
ioi.(t2)
ioi.(t1 == t2)

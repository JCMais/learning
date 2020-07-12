# Exercise: MoreCoolStuff-3

(Hard) Sometimes the first line of a CSV file is a list of the column names. Update your code to support this, and return the values in each row as a keyword list, using the column names as the keys. Here’s an example:
```
csv = ~v"""
Item,Qty,Price
Teddy bear,4,34.95
Milk,1,2.99
Battery,6,8.00
"""
```

would generate
```
[
  [Item: "Teddy bear", Qty: 4, Price: 34.95],
  [Item: "Milk", Qty: 1, Price: 2.99],
  [Item: "Battery", Qty: 6, Price: 8.00]
]
```

## Answer

See source code at [`./exercise-more-cool-stuff-3.exs`](./exercise-more-cool-stuff-3.exs)
```
❯ elixir exercise-more-cool-stuff-3.exs
[
  [Item: "Teddy bear", Qty: 4.0, Price: 34.95],
  [Item: "Milk", Qty: 1.0, Price: 2.99],
  [Item: "Battery", Qty: 6.0, Price: 8.0]
]
```

The only different between my solution and what was asked is that I've added an option to parse the header lines, `h`.

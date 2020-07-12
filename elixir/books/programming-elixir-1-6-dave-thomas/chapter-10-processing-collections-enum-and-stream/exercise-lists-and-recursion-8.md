# Exercise: ListsAndRecursion-8

The Pragmatic Bookshelf has offices in Texas (TX) and North Carolina (NC), so we have to charge sales tax on orders shipped to these states.
The rates can be expressed as a keyword list (I wish it were that simple.…):
```elixir
tax_rates = [ NC: 0.075, TX: 0.08 ]
```
Here’s a list of orders:
```elixir
orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ],
  [ id: 126, ship_to: :TX, net_amount: 44.80 ],
  [ id: 127, ship_to: :NC, net_amount: 25.00 ],
  [ id: 128, ship_to: :MA, net_amount: 10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 130, ship_to: :NC, net_amount: 50.00 ] ]
```

Write a function that takes both lists and returns a copy of the orders, but with an extra field, total_amount, which is the net plus sales tax. If a shipment is not to NC or TX, there’s no tax applied.

## Answer

See source code at [`./exercise-lists-and-recursion-8.exs`](./exercise-lists-and-recursion-8.exs)

```
❯ iex ./exercise-lists-and-recursion-8.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> TaxCalculator.run
[
  [id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5],
  [id: 124, ship_to: :OK, net_amount: 35.5, total_amount: 35.5],
  [id: 125, ship_to: :TX, net_amount: 24.0, total_amount: 25.92],
  [id: 126, ship_to: :TX, net_amount: 44.8, total_amount: 48.384],
  [id: 127, ship_to: :NC, net_amount: 25.0, total_amount: 26.875],
  [id: 128, ship_to: :MA, net_amount: 10.0, total_amount: 10.0],
  [id: 129, ship_to: :CA, net_amount: 102.0, total_amount: 102.0],
  [id: 130, ship_to: :NC, net_amount: 50.0, total_amount: 53.75]
]
```

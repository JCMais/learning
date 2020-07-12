# Exercise: StringsAndBinaries-6

Chapter 7 had an [exercise about calculating sales tax](../chapter-10-processing-collections-enum-and-stream/exercise-lists-and-recursion-8.md) on page 114. We now have the sales information in a file of comma-separated `id, ship_to, and amount` values. The file looks like this:
```
id,ship_to,net_amount
123,:NC,100.00
124,:OK,35.50
125,:TX,24.00
126,:TX,44.80
127,:NC,25.00
128,:MA,10.00
129,:CA,102.00
120,:NC,50.00
```

Write a function that reads and parses this file and then passes the result to the `sales_tax` function.
Remember that the data should be formatted into a keyword list, and that the fields need to be the correct types (so the id field is an integer, and so on).

You’ll need the library functions `File.open`, `IO.read(file, :line)`, and `IO.stream(file)`.

## Answer

The sales exercise is in fact from Chapter 10, for solution see source code at [`./exercise-strings-and-binaries-7.exs`](./exercise-strings-and-binaries-7.exs)

```
❯ iex ./exercise-strings-and-binaries-7.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> ExerciseStringsAndBinaries7.run
[
  [id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5],
  [id: 124, ship_to: :OK, net_amount: 35.5, total_amount: 35.5],
  [id: 125, ship_to: :TX, net_amount: 24.0, total_amount: 25.92],
  [id: 126, ship_to: :TX, net_amount: 44.8, total_amount: 48.384],
  [id: 127, ship_to: :NC, net_amount: 25.0, total_amount: 26.875],
  [id: 128, ship_to: :MA, net_amount: 10.0, total_amount: 10.0],
  [id: 129, ship_to: :CA, net_amount: 102.0, total_amount: 102.0],
  [id: 120, ship_to: :NC, net_amount: 50.0, total_amount: 53.75]
]
```

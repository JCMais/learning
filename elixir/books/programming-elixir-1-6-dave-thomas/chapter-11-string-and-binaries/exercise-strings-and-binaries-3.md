# Exercise: StringsAndBinaries-3
Try the following in IEx:
```
iex> [ 'cat' | 'dog' ]
['cat',100,111,103]
```

Why does IEx print `'cat'` as a string, but `'dog'` as individual numbers?

## Answer

The above code created a list where the head is now another list, we can see this by running this:
```
iex(1)> IO.inspect(['cat' | 'dog'], charlists: :as_list)
[[99, 97, 116], 100, 111, 103]
['cat', 100, 111, 103]
```

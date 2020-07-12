# Exercise: Nodes-1

Set up two terminal windows, and go to a different directory in each. Then start up a named node in each. In one window, write a function that lists the contents of the current directory.
```elixir
fun = fn -> IO.puts(Enum.join(File.ls!, ",")) end
```
Run it twice, once on each node.

## Answer

> On Node 1:
```
$ cd ../chapter-16-nodes-the-key-to-distributing-services
$ iex --sname node_one
...
iex(node_one@JCM)1> fun = fn -> IO.puts(Enum.join(File.ls!, "\n")) end
#Function<45.97283095/0 in :erl_eval.expr/5>
iex(node_one@JCM)3> fun.()
1-ticker.ex
exercise-nodes-1.md
exercise-nodes-2.md
exercise-nodes-3.exs
exercise-nodes-3.md
exercise-nodes-4.exs
exercise-nodes-4.md
:ok
```

> Node 2:
```
$ cd ./chapter-14-tooling/
$ iex --sname node_two
```

> Back on Node 1:
```
iex(node_one@jcm-mac)3> Node.spawn(:"node_two@JCM", fun) 
#PID<11619.116.0>
1-buggy
2-issues
3-stats
4-stats-property-based-testing
5-issues-code-coverage
```

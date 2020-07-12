## Exercise: WorkingWithMultipleProcesses-1

Run this code on your machine. See if you get comparable results.

### Answer
```
❯ elixir -r 5-spawn-chain.ex -e "SpawnChain.run(10)"
{4655, "Result is 10"}
❯ elixir -r 5-spawn-chain.ex -e "SpawnChain.run(100)"
{4911, "Result is 100"}
❯ elixir -r 5-spawn-chain.ex -e "SpawnChain.run(1000)"
{11539, "Result is 1000"}
❯ elixir -r 5-spawn-chain.ex -e "SpawnChain.run(10000)"
{85246, "Result is 10000"}
```

Almost similar to the ones from the Book.

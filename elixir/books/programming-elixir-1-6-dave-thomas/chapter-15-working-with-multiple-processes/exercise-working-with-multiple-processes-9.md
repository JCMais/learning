## Exercise: WorkingWithMultipleProcesses-9

Take this scheduler code and update it to let you run a function that finds the number of times the word “cat” appears in each file in a given directory.
Run one server process per file. The function `File.ls!` returns the names of files in a directory, and `File.read!` reads the contents of a file as a binary.

Can you write it as a more generalized scheduler?
Run your code on a directory with a reasonable number of files (maybe around 100) so you can experiment with the effects of concurrency.

### Answer

See source code at [`./exercise-working-with-multiple-processes-9.exs`](./exercise-working-with-multiple-processes-9.exs)

Before running the solution for this exercse, we must first populate the folder `./exercise-working-with-multiple-processes-9` by running the following script:
```
./chapter-15/exercise-working-with-multiple-processes-8/generate-files.sh
```

This will basically create 150 files with random english words.

Then:
```
elixir -r chapter-15/exercise-working-with-multiple-processes-9.exs

...

# time (s)
1 0.05
2 0.01
3 0.01
4 0.01
5 0.01
6 0.01
7 0.01
8 0.01
9 0.01
10 0.01
```

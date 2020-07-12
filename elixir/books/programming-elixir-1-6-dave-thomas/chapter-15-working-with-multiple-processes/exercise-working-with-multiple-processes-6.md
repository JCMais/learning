## Exercise: WorkingWithMultipleProcesses-6

In the `pmap` code, I assigned the value of `self` to the variable `me` at the top of the method and then used `me` as the target of the message returned by the spawned processes.

Why use a separate variable here?

### Answer

We needed the value of the parent process PID available somewhere in the scope to be able to use it in the spawned function body.

We could also have called `self` inside the first map function before the `spawn_link` call, but then we would be doing it for every item in the list, which would be unnecessarily.

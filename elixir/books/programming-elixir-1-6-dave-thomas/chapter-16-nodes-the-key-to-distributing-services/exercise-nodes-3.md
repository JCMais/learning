# Exercise: Nodes-3

Alter the code so that successive ticks are sent to each registered client (so the first goes to the first client, the second to the next client, and so on). Once the last client receives a tick, the process starts back at the first. The solution should deal with new clients being added at any time.

## Answer

See source code at [`./exercise-nodes-3.exs`](./exercise-nodes-3.exs)

> Server
```
$ iex --sname zero
...
iex(zero@jcm-mac)1> c "./exercise-nodes-3.ex"
[Client, Ticker]
iex(zero@jcm-mac)2> Ticker.start
:yes
tick
tick
tick
tick
```

> Each Client
```
$ iex --sname one
...
iex(one@jcm-mac)1> c "./exercise-nodes-3.ex"
[Client, Ticker]
iex(one@jcm-mac)2> Node.connect :"zero@jcm-mac"
true
iex(one@jcm-mac)3> Client.start
{:register, #PID<0.166.0>}
tock in client
tock in client
tock in client
```

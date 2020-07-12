# Exercise: Nodes-4

The ticker process in this chapter is a central server that sends events to registered clients. Reimplement this as a ring of clients. A client sends a tick to the next client in the ring. After 2 seconds, that client sends a tick to its next client.

When thinking about how to add clients to the ring, remember to deal with the case where a client’s receive loop times out just as you’re adding a new process. What does this say about who has to be responsible for updating the links?

## Answer

The `RingTicker` must stay responsible for updating the links to be able to correctly make the connections from one to the next one.

This code does not handle when one of the connected nodes leaves the server, as this was not required by the question, I didn't bother to add it.

Code related for this question is available at [`./exercise-nodes-4.ex`](./exercise-nodes-4.exs).

### Server
```
$ iex --sname zero
...
iex(zero@jcm-mac)1> c "./chapter-16/exercise-nodes-4.ex"
[Client, RingTicker]
iex(zero@jcm-mac)2> RingTicker.start
:yes
```

### Each Client
```
$ iex --sname one
...
iex(one@jcm-mac)1> c "./chapter-16/exercise-nodes-4.ex"
[Client, RingTicker]
iex(one@jcm-mac)2> Node.connect :"zero@jcm-mac"
true
iex(one@jcm-mac)3> Client.start
{:register, #PID<0.130.0>}
updating next pid to #PID<0.130.0>
tock in client
client tick    
#PID<0.130.0> - true
tock in client
client tick    
#PID<0.130.0> - true
tock in client
```

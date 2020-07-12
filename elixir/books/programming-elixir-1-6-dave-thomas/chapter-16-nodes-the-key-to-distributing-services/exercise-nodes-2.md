# Exercise: Nodes-2

When I introduced the interval server, I said it sent a tick “about every 2 seconds.” But in the receive loop, it has an explicit timeout of 2,000 ms. Why did I say “about” when it looks as if the time should be pretty accurate?

## Answer

The time accuracy depends if there are clients trying to register with the Ticker server, if we look at the [Ticker.generator `receiver` block](./1-ticker.exs#L15) we will see that registering clients has priority over sending the tick message. The more clients trying to register at the same time = the bigger the delay before the next tick message.

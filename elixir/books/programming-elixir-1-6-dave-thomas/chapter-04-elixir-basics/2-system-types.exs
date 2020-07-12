ioi = &IO.inspect/1

# The System types reflect resources in the underlying Erlang VM.

###########
# PID
###########
# self returns the current PID of the running process
ioi.(self())

###########
# References
###########
# The books does not say much about refs, but from documentation:
# make_ref returns a reference that is unique among all connected nodes.
# It's like a UUID, but easier to generate and more efficient.
ref = make_ref()

# Exercise: ModulesAndFunctions-7

Find the library functions to do the following, and then use each in IEx. (If the word Elixir or Erlang appears at the end of the challenge, then you’ll find the answer in that set of libraries.)

- Convert a float to a string with two decimal digits. (Erlang)
- Get the value of an operating-system environment variable. (Elixir)
- Return the extension component of a file name (so return .exs if given "dave/test.exs"). (Elixir)
- Return the process’s current working directory. (Elixir)
- Convert a string containing JSON into Elixir data structures. (Just find; don’t install.)
- Execute a command in your operating system’s shell.

## Answer

- Convert a float to a string with two decimal digits. (Erlang)
  ```elixir
  IO.inspect(:io_lib.format("~.2f", [123.456]))
  ```
- Get the value of an operating-system environment variable. (Elixir)
  ```elixir
  IO.inspect(System.get_env("USER"))
  ```
- Return the extension component of a file name (so return .exs if given "dave/test.exs"). (Elixir)
  ```elixir
  IO.inspect(Path.extname("dave/test.exs"))
  ```
- Return the process’s current working directory. (Elixir)
  ```elixir
  IO.inspect(System.cwd!())
  ```
- Convert a string containing JSON into Elixir data structures. (Just find; don’t install.)
  > https://github.com/devinus/poison
  > https://github.com/sile/jsone
- Execute a command in your operating system’s shell.
  ```elixir
  IO.inspect(System.cmd("echo", ["Hi!"]))
  ```

# It's not good to change the value of a variable inside an if or any other code block

my_var = 10

if (my_var == 10) do
  IO.puts "my_var == 10:"
  my_var = 0
  IO.puts "my_var == 0 now:"
  IO.puts my_var
end

IO.puts "my_var is back to 10:"
IO.puts my_var

Process.sleep(1000)

# The correct way is to use pattern matching / match operator:
IO.puts "correct way"
my_var = 10
my_var = if (my_var == 10) do
  IO.puts "my_var == 10 here:"
  IO.puts my_var
  0
end
IO.puts "my_var == 0 now:"
IO.puts my_var

########
# with Expression
########
# with allows to improve readability when having to declare some extra
#  variables to do some job, and to control pattern matching failure
content = "I will not change"

# file here is the pid
# to Elixir with is like a function / macro, so the arguments must start on the same line
lp =  with { :ok, file } = File.open("./sample/passwd"),
          content       = IO.read(file, :all),
          :ok           = File.close(file),
          # This will match correctly
          # [_, uid, gid] = Regex.run(~r{^_lp:.*?:(\d+):(\d+)}m, content)
          # This will not match, and give an error:
          # ** (MatchError) no match of right hand side value: nil
          # [_, uid, gid] = Regex.run(~r{^blabla:.*?:(\d+):(\d+)}m, content)
          # This will not match, but return nil instead
          [_, uid, gid] <- Regex.run(~r{^blabla:.*?:(\d+):(\d+)}m, content)
      do
        "Group: #{gid}, User: #{uid}"
      end

IO.inspect(content)
IO.inspect(lp)

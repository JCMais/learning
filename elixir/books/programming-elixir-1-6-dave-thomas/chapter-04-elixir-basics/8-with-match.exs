# if we use <- instead of =
#  and the pattern match fails, the result of the with
#  will be the value that could not be matched instead
#  of raising an error:
content = "Now is the time"

# We expect this to be run from the root of the project
result =
  with {:ok, file} = Path.expand("./chapter-04/sample/passwd") |> Path.absname() |> File.open(),
       # note: same name as above
       content = IO.read(file, :all),
       :ok = File.close(file),
       # <- instead of =
       [_, uid, gid] <- Regex.run(~r/^xxx:.*?:(\d+):(\d+)/m, content) do
    "Group: #{gid}, User: #{uid}"
  end

# => nil
IO.inspect(result)
# => Now is the time
IO.inspect(content)

# with creates a local scope, this is great if we need some temp variables
#  but do not want them to leak to the outer scope
content = "Now is the time"

# We expect this to be run from the root of the project
lp =
  with {:ok, file} = Path.expand("./chapter-04/sample/passwd") |> Path.absname() |> File.open(),
       # note: same name as above
       content = IO.read(file, :all),
       :ok = File.close(file),
       [_, uid, gid] = Regex.run(~r/^_lp:.*?:(\d+):(\d+)/m, content) do
    "Group: #{gid}, User: #{uid}"
  end

# => Group: 26, User: 26
IO.puts(lp)
# => Now is the time
IO.puts(content)

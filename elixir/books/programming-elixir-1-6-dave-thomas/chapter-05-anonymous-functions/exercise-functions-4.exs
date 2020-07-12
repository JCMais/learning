prefix = fn
  p -> fn word -> "#{p} #{word}" end
end

mrs = prefix.("Mrs")

IO.puts(mrs.("Smith"))
IO.puts(prefix.("Elixir").("Rocks"))

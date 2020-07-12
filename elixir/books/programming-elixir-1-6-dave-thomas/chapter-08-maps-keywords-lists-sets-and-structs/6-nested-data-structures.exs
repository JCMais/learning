defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

defmodule Test do
  def run do
    report = %BugReport{
      owner: %Customer{name: "Jonathan", company: "JCM"},
      details: "It's broken"
    }

    IO.inspect(report)

    IO.inspect(report.owner.name)

    # Uuuugly
    report = %BugReport{report | owner: %Customer{report.owner | name: "Jonathan Cardoso"}}
    IO.inspect(report)

    # Cleaner
    report = put_in(report.owner.company, "JC")
    IO.inspect(report)

    # We can use update_in to pass a function to get the current value
    # <> is a string concatenation, we could have used &("Mr. #{&1}") too
    report = update_in(report.owner.name, &("Mr. " <> &1))
    IO.inspect(report)

    # The thing is, called like above, those two does not support dynamic keys
    #  because, above, they are macros which expands to the code we used before.

    nil
  end
end

defmodule Sequence.Application do
  use Application

  def start(_type, initial_number) do
    # or
    # initial_values = Application.get_env(:sequence, :initial_values)
    children = [
      {Sequence.Stash, initial_number},
      {Sequence.Server, nil}
    ]

    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

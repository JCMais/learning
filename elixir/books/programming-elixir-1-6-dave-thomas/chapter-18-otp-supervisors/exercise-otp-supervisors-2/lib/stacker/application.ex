defmodule Stacker.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Stacker.Stash, []},
      {Stacker.Server, nil}
    ]

    opts = [strategy: :rest_for_one, name: Stacker.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

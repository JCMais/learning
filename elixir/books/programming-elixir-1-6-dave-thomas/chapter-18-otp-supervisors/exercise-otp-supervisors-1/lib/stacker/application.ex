defmodule Stacker.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Stacker.Server, []}
    ]

    opts = [strategy: :one_for_one, name: Stacker.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

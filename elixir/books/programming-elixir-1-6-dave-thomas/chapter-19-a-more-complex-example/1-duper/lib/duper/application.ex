defmodule Duper.Application do
  use Application

  def start(_type, _args) do
    children = [
      Duper.Results,
      {Duper.PathFinder, "/e/documentos"},
      Duper.WorkerSupervisor,
      {Duper.Gatherer, 10}
    ]

    # one_for_all because if one of the above fails, we must restart everything
    opts = [strategy: :one_for_all, name: Duper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

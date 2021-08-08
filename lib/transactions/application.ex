defmodule Transactions.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Transactions.Repo
    ]

    opts = [strategy: :one_for_one, name: Transactions.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

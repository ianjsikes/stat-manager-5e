defmodule Stat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Stat.Repo
      # Starts a worker by calling: Stat.Worker.start_link(arg)
      # {Stat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Stat.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

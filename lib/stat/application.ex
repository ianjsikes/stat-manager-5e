defmodule Stat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      Stat.Repo,
      {Plug.Cowboy, scheme: :http, plug: Stat.Router, options: [port: cowboy_port()]}
    ]

    opts = [strategy: :one_for_one, name: Stat.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:stat, :cowboy_port, 8080)
end

defmodule Stat.TestPlug do
  import Plug.Conn
  require Logger

  def init(options) do
    Logger.info("Initializing test plug with options #{inspect(options)}")
    options
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World!\n")
  end
end

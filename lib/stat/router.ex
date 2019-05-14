defmodule Stat.Router do
  use Plug.Router
  use Plug.ErrorHandler

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Jason
  )

  forward("/graphql", to: Absinthe.Plug, init_opts: [schema: Stat.Schema])
  forward("/graphiql", to: Absinthe.Plug.GraphiQL, init_opts: [schema: Stat.Schema])
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Hello World")
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end

  defp handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Something went wrong")
  end
end

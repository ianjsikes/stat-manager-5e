defmodule Stat.User do
  use Ecto.Schema

  schema "users" do
    field(:username, :string)
    has_many(:statblocks, Stat.StatBlock)
  end
end

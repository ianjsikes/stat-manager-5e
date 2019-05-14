defmodule Stat.StatBlock do
  use Ecto.Schema

  schema "statblocks" do
    field(:name, :string)
    field(:hp, :integer)
    field(:ac, :integer)
    belongs_to(:user, Stat.User)
  end
end

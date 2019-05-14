defmodule Stat.Schema.StatBlockTypes do
  use Absinthe.Schema.Notation

  object :statblock do
    field(:id, :id)
    field(:name, :string)
    field(:hp, :integer)
    field(:ac, :integer)
  end
end

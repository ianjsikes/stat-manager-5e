defmodule Stat.Schema do
  use Absinthe.Schema
  import_types(Stat.Schema.StatBlockTypes)

  # alias Stat.Resolvers

  query do
    @desc "Get all stat blocks"
    field :statblocks, list_of(:statblock) do
      resolve(fn _, _ ->
        {:ok, Stat.StatBlock |> Stat.Repo.all()}
      end)

      # resolve(&Resolvers.StatBlock.list_stat_blocks/3)
    end
  end
end

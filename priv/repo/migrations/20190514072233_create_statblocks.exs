defmodule Stat.Repo.Migrations.CreateStatblocks do
  use Ecto.Migration

  def change do
    create table(:statblocks) do
      add(:name, :string)
      add(:hp, :integer)
      add(:ac, :integer)
      add(:user_id, references(:users))
    end
  end
end

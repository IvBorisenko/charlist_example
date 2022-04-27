defmodule Charlist.Repo.Migrations.CreateCharlists do
  use Ecto.Migration

  def change do
    create table(:charlists) do
      add :wisdom, :integer, nill: false
      add :strength, :integer, nill: false
      add :dexterity, :integer, nill: false
      add :charisma, :integer, nill: false
      add :constitution, :integer, nill: false
      add :intelligence, :integer, nill: false
      add :nickname, :string, null: false
      add :user_id, references(:users)

      timestamps()
    end

    create unique_index(:charlists, [:nickname])
  end
end

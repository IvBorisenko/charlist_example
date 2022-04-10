defmodule Charlist.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string, null: false
      add :description, :text
      add :cost, :integer, null: false
      add :weight, :integer, null: false
      add :armor, :integer
      add :damage, :integer

      timestamps()
    end

    create unique_index(:items, [:name])
  end
end

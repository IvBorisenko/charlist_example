defmodule Charlist.Repo.Migrations.CreateCharlistsItems do
  use Ecto.Migration

  def change do
    create table(:charlists_items) do
      add :charlist_id, references(:charlists)
      add :item_id, references(:items)
      add :description, :text

      timestamps()
    end

    create unique_index(:charlists_items, [:charlist_id, :item_id])
  end
end

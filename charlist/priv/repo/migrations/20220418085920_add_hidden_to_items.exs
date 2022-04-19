defmodule Charlist.Repo.Migrations.AddHiddenToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :hidden, :boolean, default: false, null: false
    end
  end
end

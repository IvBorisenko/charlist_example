defmodule Charlist.Charlists.Commands.UpdateCharlist do
  alias Charlist.Charlists.Entities.CharlistEntity
  alias Charlist.Repo

  def process(%CharlistEntity{} = charlist, attrs) do
    charlist
    |> CharlistEntity.update_changeset(attrs)
    |> Repo.update()
  end
end

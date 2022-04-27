defmodule Charlist.Charlists.Commands.CreateCharlist do
  alias Charlist.Charlists.Entities.CharlistEntity
  alias Charlist.Repo

  def process(attrs) do
    %CharlistEntity{}
    |> CharlistEntity.create_changeset(attrs)
    |> Repo.insert()
  end
end

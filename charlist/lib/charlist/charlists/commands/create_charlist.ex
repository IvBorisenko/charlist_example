defmodule Charlist.Charlists.Commands.CreateCharlist do
  alias Charlist.Repo
  alias Charlist.Charlists.Entities.CharlistEntity

  def process(attrs) do
    %CharlistEntity{}
    |> CharlistEntity.create_changeset(attrs)
    |> Repo.insert()
  end
end

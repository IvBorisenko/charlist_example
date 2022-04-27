defmodule Charlist.Charlists.Queries.GetCharlist do
  alias Charlist.Charlists.Entities.CharlistEntity
  alias Charlist.Repo

  def process(id) do
    Repo.find(CharlistEntity, id)
  end
end

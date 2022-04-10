defmodule Charlist.Charlists.Queries.GetCharlist do
  alias Charlist.Repo
  alias Charlist.Charlists.Entities.CharlistEntity

  def process(id) do
    Repo.find(CharlistEntity, id)
  end
end

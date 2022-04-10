defmodule Charlist.Charlists.Queries.GetCharlist do
  alias Charlist.Repo
  alias Charlist.Charlists.Entities.Charlist

  def process(id) do
    Repo.find(Charlist, id)
  end
end

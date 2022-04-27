defmodule Charlist.Charlists.Commands.DeleteCharlist do
  alias Charlist.Charlists.Entities.CharlistEntity
  alias Charlist.Repo

  def process(%CharlistEntity{} = charlist) do
    Repo.delete(charlist)
  end
end

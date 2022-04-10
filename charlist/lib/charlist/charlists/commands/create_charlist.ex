defmodule Charlist.Charlists.Commands.CreateCharlist do
  alias Charlist.Repo
  alias Charlist.Charlists.Entities.Charlist

  def process(attrs) do
    %Charlist{}
    |> Charlist.create_changeset(attrs)
    |> Repo.insert()
  end
end

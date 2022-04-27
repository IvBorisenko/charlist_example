defmodule Charlist.Items.Commands.CreateItem do
  alias Charlist.Items.Entities.Item
  alias Charlist.Repo

  def process(attrs) do
    %Item{}
    |> Item.create_changeset(attrs)
    |> Repo.insert()
  end
end

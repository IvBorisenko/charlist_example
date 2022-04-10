defmodule Charlist.Items.Commands.CreateItem do
  alias Charlist.Repo
  alias Charlist.Items.Entities.Item

  def process(attrs) do
    %Item{}
    |> Item.create_changeset(attrs)
    |> Repo.insert()
  end
end

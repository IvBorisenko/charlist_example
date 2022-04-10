defmodule Charlist.Items.Queries.GetItem do
  alias Charlist.Repo
  alias Charlist.Items.Entities.Item

  def process(id) do
    Repo.find(Item, id)
  end
end

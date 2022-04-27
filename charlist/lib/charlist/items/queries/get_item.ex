defmodule Charlist.Items.Queries.GetItem do
  import Ecto.Query, only: [from: 2]

  alias Charlist.Items.Entities.Item
  alias Charlist.Repo

  def process(id) do
    Item
    |> by_id(id)
    |> not_hidden()
    |> Repo.fetch_one()
  end

  defp by_id(query, id) do
    from item in query,
      where: item.id == ^id
  end

  defp not_hidden(query) do
    from item in query,
      where: not item.hidden
  end
end

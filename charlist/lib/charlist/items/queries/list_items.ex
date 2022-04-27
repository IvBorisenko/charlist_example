defmodule Charlist.Items.Queries.ListItems do
  @moduledoc false

  import Ecto.Query, only: [from: 2]

  alias Charlist.Items.Entities.Item
  alias Charlist.Repo

  # %{name: "John", cost: 10} = params
  def process(params) do
    Item
    |> with_cost(params)
    |> with_name(params)
    |> select_fields()
    |> Repo.all()
  end

  defp with_cost(query, %{cost: nil}), do: query

  defp with_cost(query, %{cost: cost}) do
    from i in query,
      where: i.cost > ^cost
  end

  defp with_cost(query, _), do: query

  defp with_name(query, %{name: nil}), do: query

  defp with_name(query, %{name: name}) when is_binary(name) do
    name = "%" <> String.trim(name) <> "%"

    from i in query,
      where: ilike(i.name, ^name)
  end

  defp with_name(query, _), do: query

  defp select_fields(query) do
    from i in query,
      select: %{id: i.id, name: i.name}
  end
end

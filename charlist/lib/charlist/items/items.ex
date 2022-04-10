defmodule Charlist.Items do
  alias Charlist.Items.Commands.{
    CreateItem
  }

  alias Charlist.Items.Queries.{
    GetItem,
    ListItems
  }

  defdelegate create_item(attrs), to: CreateItem, as: :process

  defdelegate get_item(id), to: GetItem, as: :process
  defdelegate list_items(params), to: ListItems, as: :process
end

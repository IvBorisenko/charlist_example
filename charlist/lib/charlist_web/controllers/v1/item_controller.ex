defmodule CharlistWeb.V1.ItemController do
  use CharlistWeb, :controller

  alias Charlist.Items

  action_fallback(CharlistWeb.FallbackController)

  def index(conn, _params) do
    items = Items.list_items()
    render(conn, "index.json", %{items: items})
  end

  def show(conn, %{"id" => id}) do
    with {:ok, item} <- Items.get_item(id) do
      render(conn, "show.json", %{item: item})
    end
  end
end

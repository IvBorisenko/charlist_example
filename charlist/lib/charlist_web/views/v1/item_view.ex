defmodule CharlistWeb.V1.ItemView do
  use CharlistWeb, :view

  def render("index.json", %{items: items}) do
    render_many(items, __MODULE__, "show.json", as: :item)
  end

  def render("show.json", %{item: item}) do
    %{
      id: item.id,
      name: item.name
    }
  end
end

defmodule CharlistWeb.V1.CharlistView do
  use CharlistWeb, :view

  def render("index.json", %{charlists: charlists}) do
    render_many(charlists, __MODULE__, "show.json", as: :charlist)
  end

  def render("show.json", %{charlist: charlist}) do
    %{
      id: charlist.id,
      nickname: charlist.nickname
    }
  end
end

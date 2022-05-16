defmodule CharlistWeb.V1.CharlistView do
  use CharlistWeb, :view

  def render("index.json", %{page: page}) do
    %{
      entries: render_many(page.entries, __MODULE__, "show.json", as: :charlist),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{charlist: charlist}) do
    %{
      id: charlist.id,
      nickname: charlist.nickname
    }
  end
end

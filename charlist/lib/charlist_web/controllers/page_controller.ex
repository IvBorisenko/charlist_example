defmodule CharlistWeb.PageController do
  use CharlistWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

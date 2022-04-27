defmodule CharlistWeb.V1.CharlistController do
  use CharlistWeb, :controller

  alias Charlist.Charlists
  alias CharlistWeb.V1.CharlistPolicy

  action_fallback(CharlistWeb.FallbackController)

  def index(conn, params) do
    user = conn.assigns.current_user
    charlists = Charlists.list_charlists(user, params)
    render(conn, "index.json", %{charlists: charlists})
  end

  def show(conn, %{"id" => id}) do
    user = conn.assigns.current_user
    Charlists.get_charlist(id)

    with {:ok, charlist} <- Charlists.get_charlist(id),
         :ok <- Bodyguard.permit(CharlistPolicy, :show, user, charlist) do
      render(conn, "show.json", %{charlist: charlist})
    end
  end
end

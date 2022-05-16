defmodule CharlistWeb.V1.CharlistController do
  use CharlistWeb, :controller

  alias Charlist.Charlists
  alias CharlistWeb.V1.CharlistPolicy

  action_fallback(CharlistWeb.FallbackController)

  defmodule IndexSearchParams do
    use Params.Schema, %{
      wisdom: :integer,
      strength: :integer,
      dexterity: :integer,
      charisma: :integer,
      constitution: :integer,
      intelligence: :integer,
      nickname: :string,
      page!: :integer,
      page_size!: :integer
    }
  end

  def index(conn, %{"current_user" => current_user} = params) do
    with {:ok, params} <- ApplyParams.do_apply(IndexSearchParams, params) do
      page = Charlists.list_charlists(current_user, params)
      render(conn, "index.json", %{page: page})
    end
  end

  def show(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, charlist} <- Charlists.get_charlist(id),
         :ok <- Bodyguard.permit(CharlistPolicy, :show, current_user, charlist) do
      render(conn, "show.json", %{charlist: charlist})
    end
  end
end

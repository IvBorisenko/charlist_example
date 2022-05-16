defmodule CharlistWeb.V1.UserController do
  use CharlistWeb, :controller

  alias Charlist.Accounts
  alias Charlist.Accounts.Auth

  action_fallback(CharlistWeb.FallbackController)

  defmodule CreateUserParams do
    use Params.Schema, %{
      email!: :string,
      password!: :string
    }

    def data_as_map(params) do
      with {:ok, attrs} <- data(params) do
        {:ok, Map.take(attrs, [:email, :password])}
      end
    end
  end

  def create(conn, attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(CreateUserParams, attrs),
         {:ok, user} <- Accounts.create_user(attrs),
         {:ok, access_token, refresh_token} <- Auth.sign_user(user) do
      conn
      |> put_status(:created)
      |> render("create.json", %{
        user: user,
        access_token: access_token,
        refresh_token: refresh_token
      })
    end
  end
end

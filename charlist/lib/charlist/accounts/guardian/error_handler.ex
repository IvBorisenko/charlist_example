defmodule Charlist.Accounts.Guardian.ErrorHandler do
  use CharlistWeb, :controller

  alias Charlist.Changeset.Error
  alias CharlistWeb.ErrorView

  def auth_error(conn, {type, _reason}, _opts) do
    error =
      type
      |> to_string()
      |> Error.auth_error()

    conn
    |> put_status(401)
    |> put_view(ErrorView)
    |> render("401.json", error: error)
  end
end

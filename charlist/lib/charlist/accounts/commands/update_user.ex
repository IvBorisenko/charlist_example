defmodule Charlist.Accounts.Commands.UpdateUser do
  alias Charlist.Accounts.Entities.User
  alias Charlist.Repo

  def process(%User{} = user, attrs) do
    user
    |> User.update_changeset(attrs)
    |> Repo.update()
  end
end

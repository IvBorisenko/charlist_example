defmodule Charlist.Accounts.Commands.UpdateUser do
  alias Charlist.Repo
  alias Charlist.Accounts.Entities.User

  def process(%User{} = user, attrs) do
    user
    |> User.update_changeset(attrs)
    |> Repo.insert()
  end
end

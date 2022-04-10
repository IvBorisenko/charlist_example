defmodule Charlist.Accounts.Commands.CreateUser do
  alias Charlist.Repo
  alias Charlist.Accounts.Entities.User

  def process(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end
end

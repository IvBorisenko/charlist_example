defmodule Charlist.Accounts.Commands.CreateUser do
  alias Charlist.Accounts.Entities.User
  alias Charlist.Repo

  def process(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end
end

defmodule Charlist.Accounts.Commands.DeleteUser do
  alias Charlist.Accounts.Entities.User
  alias Charlist.Repo

  def process(%User{} = user) do
    Repo.delete(user)
  end
end

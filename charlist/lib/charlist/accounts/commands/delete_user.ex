defmodule Charlist.Accounts.Commands.DeleteUser do
  alias Charlist.Repo
  alias Charlist.Accounts.Entities.User

  def process(%User{} = user) do
    Repo.delete(user)
  end
end

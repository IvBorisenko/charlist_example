defmodule Charlist.Accounts.Queries.ListUsers do
  alias Charlist.Accounts.Entities.User
  alias Charlist.Repo

  def process do
    Repo.all(User)
  end
end

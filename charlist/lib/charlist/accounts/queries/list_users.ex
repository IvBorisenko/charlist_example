defmodule Charlist.Accounts.Queries.ListUsers do
  alias Charlist.Repo
  alias Charlist.Accounts.Entities.User

  def process() do
    Repo.all(User)
  end
end

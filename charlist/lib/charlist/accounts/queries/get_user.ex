defmodule Charlist.Accounts.Queries.GetUser do
  alias Charlist.Repo
  alias Charlist.Accounts.Entities.User

  def process(id) do
    Repo.find(User, id)
  end
end

defmodule Charlist.Accounts.Queries.GetUser do
  @moduledoc """
  ShortDecription
  """
  alias Charlist.Accounts.Entities.User
  alias Charlist.Repo

  def process(id) do
    Repo.find(User, id)
  end
end

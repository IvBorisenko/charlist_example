defmodule Charlist.Accounts.Queries.ListUsersTest do
  use Charlist.DataCase

  alias Charlist.Accounts

  test "process/1 list_users test" do
    insert_list(10, :user)
    result = Accounts.list_users()
    assert length(result) == 10
  end
end

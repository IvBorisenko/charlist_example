defmodule Charlist.Accounts.Auth do
  alias Charlist.Accounts.Entities.User
  alias Charlist.Accounts.Services.Guardian

  def sign_user(%User{} = user), do: Guardian.sign(user)
end

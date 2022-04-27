defmodule CharlistWeb.V1.CharlistPolicy do
  @behaviour Bodyguard.Policy

  alias Charlist.Accounts.Entities.User
  alias Charlist.Charlists.Entities.CharlistEntity

  def authorize(action, %User{id: id}, %CharlistEntity{user_id: id})
      when action in [:show, :update],
      do: :ok

  def authorize(_action, _user, _params), do: false
end

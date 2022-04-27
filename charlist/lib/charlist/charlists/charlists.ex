defmodule Charlist.Charlists do
  alias Charlist.Charlists.Commands.{
    CreateCharlist,
    DeleteCharlist,
    UpdateCharlist
  }

  alias Charlist.Charlists.Queries.{
    GetCharlist,
    ListCharlists
  }

  defdelegate create_charlist(attrs), to: CreateCharlist, as: :process
  defdelegate update_charlist(charlist, attrs), to: UpdateCharlist, as: :process
  defdelegate delete_charlist(charlist), to: DeleteCharlist, as: :process

  defdelegate get_charlist(id), to: GetCharlist, as: :process
  defdelegate list_charlists(user, params \\ %{}), to: ListCharlists, as: :process
end

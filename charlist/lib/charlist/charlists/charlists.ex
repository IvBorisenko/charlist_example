defmodule Charlist.Charlists do
  alias Charlist.Charlists.Commands.{
    CreateCharlist
  }

  alias Charlist.Charlists.Queries.{
    GetCharlist
  }

  defdelegate create_charlist(attrs), to: CreateCharlist, as: :process

  defdelegate get_charlist(id), to: GetCharlist, as: :process
end

defmodule Charlist.Charlists.Queries.ListCharlists do
  @moduledoc """
   Provide lists of charlists with pagination and filters.
  """
  import Ecto.Query, only: [from: 2]

  alias Charlist.Charlists.Entities.CharlistEntity
  alias Charlist.Repo

  def process(user, params) do
    CharlistEntity
    |> by_user(user.id)
    |> with_wisdom(params)
    |> with_strength(params)
    |> with_dexterity(params)
    |> with_charisma(params)
    |> with_constitution(params)
    |> with_intelligence(params)
    |> with_nickname(params)
    |> select_fields()
    |> Repo.paginate(params)
  end

  defp by_user(query, user_id) do
    from charlist in query,
      where: charlist.user_id == ^user_id
  end

  defp with_wisdom(query, %{wisdom: wisdom}) do
    from charlist in query,
      where: charlist.wisdom == ^wisdom
  end

  defp with_wisdom(query, _), do: query

  defp with_strength(query, %{strength: strength}) do
    from charlist in query,
      where: charlist.strength == ^strength
  end

  defp with_strength(query, _), do: query

  defp with_dexterity(query, %{dexterity: dexterity}) do
    from charlist in query,
      where: charlist.dexterity == ^dexterity
  end

  defp with_dexterity(query, _), do: query

  defp with_charisma(query, %{charisma: charisma}) do
    from charlist in query,
      where: charlist.charisma == ^charisma
  end

  defp with_charisma(query, _), do: query

  defp with_constitution(query, %{constitution: constitution}) do
    from charlist in query,
      where: charlist.constitution == ^constitution
  end

  defp with_constitution(query, _), do: query

  defp with_intelligence(query, %{intelligence: intelligence}) do
    from charlist in query,
      where: charlist.intelligence == ^intelligence
  end

  defp with_intelligence(query, _), do: query

  defp with_nickname(query, %{nickname: nickname}) do
    nickname = "%" <> String.trim(nickname) <> "%"

    from charlist in query,
      where: ilike(charlist.nickname, ^nickname)
  end

  defp with_nickname(query, _), do: query

  defp select_fields(query) do
    from charlist in query,
      order_by: [asc: :inserted_at],
      select: %{id: charlist.id, nickname: charlist.nickname}
  end
end

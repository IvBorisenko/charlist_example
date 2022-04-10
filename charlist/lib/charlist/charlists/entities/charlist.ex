defmodule Charlist.Charlists.Entities.Charlist do
  use Ecto.Schema

  import Ecto.Changeset

  alias Charlist.Accounts.Entities.User

  @required [
    :wisdom,
    :strenght,
    :dexterity,
    :charisma,
    :constitution,
    :intelligence,
    :nickname,
    :user_id
  ]

  schema "charlists" do
    field :wisdom, :integer
    field :strenght, :integer
    field :dexterity, :integer
    field :charisma, :integer
    field :constitution, :integer
    field :intelligence, :integer
    field :nickname, :string

    belongs_to :user, User

    timestamps()
  end

  def create_changeset(%__MODULE__{} = charlist, attrs) do
    charlist
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> validate_number(:wisdom, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:strenght, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:dexterity, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:charisma, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:constitution, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> validate_number(:intelligence, less_than_or_equal_to: 20, greater_than_or_equal_to: 1)
    |> assoc_constraint(:user)
    |> unique_constraint(:nickname)
  end
end
